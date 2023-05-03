<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\Strongadmin\Product;

use Illuminate\Http\Request;
use App\Http\Controllers\Strongadmin\BaseController;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Carbon;
use App\Models\Admin\Product\Product;
use App\Repositories\Admin\ProductRepositories;
use Illuminate\Support\Facades\DB;
use App\Models\Product\SpecGroup;
use App\Models\Admin\Product\Spec;
use App\Models\Product\Brand;
use App\Models\Admin\Product\Category;
use Illuminate\Support\Facades\Cache;

class ProductController extends BaseController
{

    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Admin\Product\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, Product $product)
    {
        if (!$request->expectsJson())
        {
            $model = Category::query();
            $model->orderBy('sort', 'DESC');
            $model->where('type', 1)->where('level', 1);
            $model->with(['children' => function($query) {
                    $query->orderBy('sort', 'DESC');
                    $query->select('id', 'parent_id', 'name as name_label');
                    $query->with(['children' => function($query) {
                            $query->orderBy('sort', 'DESC');
                            $query->select('id', 'parent_id', 'name as name_label');
                        }]);
                }]);
            $categories = $model->select('id', 'name as name_label')->get();

            return $this->view('product.index', ['model' => $product, 'categories' => $categories]);
        }
        $model = Product::orderBy(($request->field ?: 'id'), ($request->order ?: 'desc'));
        $model->select('*', 'title as title_label');
        if ($request->category_id)
        {
            $model->whereHas('categories', function($query)use($request) {
                $query->where('category_id', $request->category_id);
            });
        }
        if ($request->title)
        {
            $model->where('title', 'like', "%{$request->title}%");
        }
        if ($request->intro)
        {
            $model->where('intro', 'like', "%{$request->intro}%");
        }
        if ($request->spu)
        {
            $model->where('spu', $request->spu);
        }
        if ($request->sku)
        {
            $model->where('sku', $request->sku);
        }
        if ($request->stock)
        {
            $model->where('stock', $request->stock);
        }
        if ($request->stock_status)
        {
            $model->where('stock_status', $request->stock_status);
        }
        if ($request->original_price)
        {
            $model->where('original_price', $request->original_price);
        }
        if ($request->sale_price)
        {
            $model->where('sale_price', $request->sale_price);
        }
        if ($request->long)
        {
            $model->where('long', $request->long);
        }
        if ($request->width)
        {
            $model->where('width', $request->width);
        }
        if ($request->high)
        {
            $model->where('high', $request->high);
        }
        if ($request->weight)
        {
            $model->where('weight', $request->weight);
        }
        if ($request->volume_weight)
        {
            $model->where('volume_weight', $request->volume_weight);
        }
        if ($request->click_num)
        {
            $model->where('click_num', $request->click_num);
        }
        if ($request->status)
        {
            $model->where('status', $request->status);
        }
        if ($request->remark)
        {
            $model->where('remark', 'like', "%{$request->remark}%");
        }
        if ($request->created_at_begin && $request->created_at_end)
        {
            $model->whereBetween('created_at', [$request->created_at_begin, Carbon::parse($request->created_at_end)->endOfDay()]);
        }
        if ($request->brand_id)
        {
            $model->where('brand_id', $request->brand_id);
        }
        if ((isset($request->page) && $request->page <= 0) || $request->export)
        {
            $rows = $model->get();
        } else
        {
            $rows = $model->paginate($request->limit);
        }
        //$rows->makeHidden(['deleted_at']);
        return ['code' => 200, 'message' => __('admin.Success'), 'data' => $rows];
    }

    /**
     * Display the specified resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required', 'integer', Rule::exists('product')],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = Product::find($request->id);
        if ($model)
        {
            return ['code' => 200, 'message' => __('admin.Success'), 'data' => $model];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Store a newly created resource in storage.
     * 
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Admin\Product\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, Product $product)
    {
        if (!$request->expectsJson())
        {
            $categories = ProductRepositories::categoryTree(); //分類
            //規格
            $specGroups = SpecGroup::query()->get();
            $specs = [];
            $brands = Brand::query()->get(); //品牌
            $product->status = 1;
            $product->hidden = 2;
            return $this->view('product.form', ['model' => $product, 'categories' => $categories, 'specGroups' => $specGroups, 'specs' => $specs, 'brands' => $brands]);
        }
        $data = $request->all();
        $rules = array_merge_recursive($product->rules(), [
            'sku' => ['unique:product'],
        ]);
        $validator = Validator::make($data, $rules, $product->messages(), $product->customAttributes());
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        // 同屬於一個 spu 的 產品(sku)，價格規格不能重複
        $exists_spec_sku = ProductRepositories::checkUniqueSpec($request->productSpecs, $request->spu);
        if ($exists_spec_sku !== false)
        {
            return ['code' => 4001, 'message' => "規格重複，同屬于spu({$request->spu})的產品價格規格已存在，該產品 sku 為： {$exists_spec_sku}"];
        }

        $product->fill($data);
        DB::transaction(function() use($product, $request) {
            $productSpecs = ProductRepositories::pluckSpecs($request->productSpecs); //處理前端提交的產品規格
            $categories = ProductRepositories::pluckCategoryId($request->categories); //處理前端提交的分類樹數據
            //產品儲存
            $product->save();

            /*
             * 模型同步關聯 sync 
             * 使用方式參考：https://learnku.com/docs/laravel/6.x/eloquent-relationships/5177#3733b2
             */
            $product->categories()->sync($categories); //儲存分類
            $product->specs()->sync($productSpecs); //儲存規格
        });
        
        //清除首頁推薦商品快取
        Cache::forget('product:home');
        
        return [
            'code' => 200,
            'message' => __('admin.SuccessCreated'),
            'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessCreated'), $product->tableComments, $product->id)
        ];
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Admin\Product\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        if (!$request->expectsJson())
        {
            $model = $product::find($request->id);
            $ids = $model->categories->pluck('id')->toArray();
            $categories = ProductRepositories::categoryTree($ids);
            $specGroups = SpecGroup::query()->get(); //規格組列表
            $brands = Brand::query()->get(); //品牌
            return $this->view('product.form', ['model' => $model, 'categories' => $categories, 'specGroups' => $specGroups, 'brands' => $brands]);
        }
        if (!$request->is_hot)
        {
            $request->merge(['is_hot' => 2]);
        }
        if (!$request->is_new)
        {
            $request->merge(['is_new' => 2]);
        }
        if (!$request->is_recommend)
        {
            $request->merge(['is_recommend' => 2]);
        }
        $rules = array_merge_recursive($product->rules(), [
            'id' => ['required', 'integer', Rule::exists('product')],
            'sku' => [Rule::unique('product')->ignore($request->id)],
        ]);
        $messages = $product->messages();
        $customAttributes = $product->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        if ($request->productSpecs && $request->spu)
        {
            // 同屬於一個 spu 的 產品(sku)，價格規格不能重複
            $exists_spec_sku = ProductRepositories::checkUniqueSpec($request->productSpecs, $request->spu, $request->id);
            if ($exists_spec_sku !== false)
            {
                return ['code' => 4001, 'message' => "規格重複，同屬于spu({$request->spu})的產品價格規格已存在，該產品 sku 為： {$exists_spec_sku}"];
            }
        }
        $model = $product::find($request->id);
        $model->fill($request->all());
        $logDirty = $model->getDirty();
        $logOriginal = $model->getOriginal();
        DB::transaction(function() use($model, $request) {
            $productSpecs = ProductRepositories::pluckSpecs($request->productSpecs); //處理前端提交的產品規格
            $categories = ProductRepositories::pluckCategoryId($request->categories); //處理前端提交的分類樹數據
            //產品儲存
            $model->save();

            /*
             * 模型同步關聯 sync 
             * 使用方式參考：https://learnku.com/docs/laravel/6.x/eloquent-relationships/5177#3733b2
             */
            $model->categories()->sync($categories); //儲存分類
            $model->specs()->sync($productSpecs); //儲存規格
        });
        
        //清除首頁推薦商品快取
        Cache::forget('product:home');
        
        return [
            'code' => 200,
            'message' => __('admin.SuccessUpdated'),
            'log' => sprintf('[%s][%s][id:%s][sku:%s]', __('admin.SuccessUpdated'), $model->tableComments, $model->id, $model->sku),
            'logOriginal' => $logOriginal,
            'logDirty' => $logDirty
        ];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Admin\Product\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, Product $product)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required',],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = is_array($request->id) ? $request->id : [$request->id];
        $model = $product::whereIn('id', $ids);
        DB::beginTransaction();
        if ($model->delete())
        {
            DB::table('product_spec')->whereIn('product_id', $ids)->delete();
            DB::table('product_category')->whereIn('product_id', $ids)->delete();
            DB::commit();
            return [
                'code' => 200,
                'message' => __('admin.SuccessDestroyed'),
                'log' => sprintf('[%s][%s]『id:%s』', __('admin.SuccessDestroyed'), $product->tableComments, json_encode($ids))
            ];
        } else
        {
            DB::rollBack();
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * 產品規格 html部分
     * @param Request $request
     * @return type
     */
    public function specHtmlString(Request $request)
    {
        $specs = [];
        $productSpecs = [];
        if ($request->specGroupId)
        {
            //已有的規格列表
            $specs = Spec::query()
                    ->orderBy('spec_type')
                    ->where('spec_group_id', $request->specGroupId)
                    ->select('*', 'select_values as select_values_array', 'name as name_label')
                    ->get();
        }
        if ($request->productId)
        {
            //已選的產品規格列表
            $model = Product::find($request->productId);
            $productSpecs = $model->specs()->pluck('spec_value', 'spec_id');
        }
        $contents = $this->view('product.spec', ['specs' => $specs, 'productSpecs' => $productSpecs])->render();
        return ['code' => 200, 'message' => __('admin.Success'), 'data' => $contents];
    }

    /**
     * 複製
     * @param Request $request
     * @param Product $product
     * @return type
     */
    public function copy(Request $request, Product $product)
    {
        $model = $product::find($request->id);
        $ids = $model->categories->pluck('id')->toArray();
        $categories = ProductRepositories::categoryTree($ids);
        $specGroups = SpecGroup::query()->get(); //規格組列表
        $brands = Brand::query()->get(); //品牌
        return $this->view('product.form', ['model' => $model, 'categories' => $categories, 'specGroups' => $specGroups, 'brands' => $brands, '_action' => route('product.create')]);
    }

}
