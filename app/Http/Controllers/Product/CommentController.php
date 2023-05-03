<?php

namespace App\Http\Controllers\Product;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use App\Models\Product\ProductComment;
use App\Models\Product\ProductCommentLike;
use App\Models\Product\Product;
use App\Repositories\UserRepository;

class CommentController extends Controller
{

    public function list(Request $request)
    {
        $model = ProductComment::query()
                ->orderByDesc('updated_at')
                ->where('status', 1)
                ->with('user:id,first_name,last_name,country_code')
                ->select('*', 'pictures as asset_picture_cover', 'created_at as upload_at', 'content as content_short');
        if ($request->spu)
        {
            $model->where('product_spu', $request->spu);
        } elseif ($request->product_id)
        {
            $model->where('product_id', $request->product_id);
        }
        $rows = $model->paginate()->appends($request->all());
        $rows->makeHidden(['pictures', 'videos', 'more']);
        $rowsGroup = ProductComment::query()->where('status', 1)->where('product_id', $request->product_id)->groupBy('star')->select(\DB::raw('count(*) as count'), 'star')->get()->keyBy('star')->toArray();
        $data_total['star1'] = $rowsGroup[1]['count'] ?? 0;
        $data_total['star2'] = $rowsGroup[2]['count'] ?? 0;
        $data_total['star3'] = $rowsGroup[3]['count'] ?? 0;
        $data_total['star4'] = $rowsGroup[4]['count'] ?? 0;
        $data_total['star5'] = $rowsGroup[5]['count'] ?? 0;
        if ($this->isApi)
        {
            return ['code' => 200, 'message' => __('Success'), 'data' => $rows, 'data_total' => $data_total];
        }
        if ($request->no_header)
        {
            $layouts = 'layouts.app_no_header';
        } else
        {
            $layouts = 'layouts.app';
        }
        return view('product.comment.list', ['rows' => $rows, 'layouts' => $layouts, 'data_total' => $data_total]);
    }

    public function create(Request $request)
    {
        if (!$request->expectsJson())
        {
            return view('product.comment.create');
        }
        $rules = [
            'at_user_id' => ['nullable', 'integer', Rule::exists('user', 'id')->where('status', 1)->whereNull('deleted_at')],
            'product_id' => ['required', 'integer', Rule::exists('product', 'id')->where('status', 1)->whereNull('deleted_at')],
            'star' => ['required', 'integer', 'in:1,2,3,4,5'],
            'pictures' => ['nullable', 'array'],
            'pictures.*.src' => ['string', 'min:1', 'max:999'],
            'pictures.*.src_thumb' => ['string', 'min:1', 'max:999'],
            'pictures.*.thumb_width' => ['numeric', 'min:1'],
            'pictures.*.thumb_height' => ['numeric', 'min:1'],
            'content' => ['required', 'string', 'min:10', 'max:2000'],
        ];
        $customAttributes = [
            'pictures' => __('comment pictures'),
            'content' => __('comment content'),
        ];
        $customMessages = [
            'more.steps.*.content' => ':more.steps.*.content 不能為空',
        ];
        $validator = Validator::make($request->all(), $rules, $customMessages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        if ($request->product_id)
        {
            $product = Product::find($request->product_id);
        }

        $model = new ProductComment();
        $model->user_id = $this->user->id;
        $model->first_name = $this->user->first_name;
        $model->last_name = $this->user->last_name;
        $model->country = $this->user->country;
        $model->at_user_id = (int) $request->at_user_id;
        $model->product_id = (int) $request->product_id;
        $model->product_sku = isset($product) ? $product->sku : '';
        $model->product_spu = isset($product) ? $product->spu : '';
        $model->status = 2;
        $model->credits = (int) app('strongshop')->getShopConfig('commet_reward_credits');
        $model->content = $request->content; //評論內容
        $model->pictures = $request->pictures;
        $model->videos = $request->videos;
        $model->star = $request->star;
        //$model->more = $request->more;
        $model->save();

        return ['code' => 200, 'message' => __('Submitted successfully, please wait for review')];
    }

    public function searchProduct(Request $request)
    {
        $model = Product::query();
        $model->where('status', 1);
        $model->where('sku', $request->sku);
        $model->select(['id', 'title', 'stock', 'stock_status', 'original_price', 'sale_price', 'img_cover', 'click_num']);
        $rows = $model->paginate(12)->appends($request->all());
        return ['code' => 200, 'message' => 'Success', 'data' => $rows];
    }

}
