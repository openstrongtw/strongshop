<?php

namespace App\Http\Controllers\Strongadmin\Product;

use Illuminate\Http\Request;
use App\Http\Controllers\Strongadmin\BaseController;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Carbon;
use App\Models\Product\ProductComment;
use App\Repositories\UserRepository;

class CommentController extends BaseController
{

    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product\ProductComment  $productComment
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, ProductComment $productComment)
    {
        if (!$request->expectsJson())
        {
            return $this->view('product.comment.index', ['model' => $productComment]);
        }
        $model = ProductComment::orderBy(($request->field ?: 'id'), ($request->order ?: 'desc'));
        if ($request->id)
        {
            $model->where('id', $request->id);
        }
        if ($request->user_id)
        {
            $model->where('user_id', $request->user_id);
        }
        if ($request->first_name)
        {
            $model->where('first_name', 'like', "%{$request->first_name}%");
        }
        if ($request->last_name)
        {
            $model->where('last_name', 'like', "%{$request->last_name}%");
        }
        if ($request->country)
        {
            $model->where('country', 'like', "%{$request->country}%");
        }
        if ($request->at_user_id)
        {
            $model->where('at_user_id', $request->at_user_id);
        }
        if ($request->product_id)
        {
            $model->where('product_id', $request->product_id);
        }
        if ($request->product_sku)
        {
            $model->where('product_sku', 'like', "%{$request->product_sku}%");
        }
        if ($request->content)
        {
            $model->where('content', 'like', "%{$request->content}%");
        }
        if ($request->pictures)
        {
            $model->where('pictures', 'like', "%{$request->pictures}%");
        }
        if ($request->videos)
        {
            $model->where('videos', 'like', "%{$request->videos}%");
        }
        if ($request->likes)
        {
            $model->where('likes', $request->likes);
        }
        if ($request->more)
        {
            $model->where('more', 'like', "%{$request->more}%");
        }
        if ($request->status)
        {
            $model->where('status', $request->status);
        }
        if ($request->credits)
        {
            $model->where('credits', $request->credits);
        }
        if ($request->created_at_begin && $request->created_at_end)
        {
            $model->whereBetween('created_at', [$request->created_at_begin, Carbon::parse($request->created_at_end)->endOfDay()]);
        }
        $model->with('user:id,email');
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
                    'id' => ['required', 'integer', Rule::exists('product_comment')],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = ProductComment::find($request->id);
        return $this->view('product.comment.show', ['model' => $model]);
    }

    /**
     * Store a newly created resource in storage.
     * 
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product\ProductComment  $productComment
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, ProductComment $productComment)
    {
        if (!$request->expectsJson())
        {
            return $this->view('product.comment.form', ['model' => $productComment]);
        }
        $rules = array_merge_recursive($productComment->rules(), [
        ]);
        $messages = $productComment->messages();
        $customAttributes = $productComment->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $productComment->fill($request->all());
        if ($productComment->save())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessCreated'),
                'data' => $productComment,
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessCreated'), $productComment->tableComments, $productComment->id)
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product\ProductComment  $productComment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ProductComment $productComment)
    {
        if (!$request->expectsJson())
        {
            $model = $productComment::find($request->id);
            return $this->view('product.comment.form', ['model' => $model]);
        }
        $rules = array_merge_recursive($productComment->rules(), [
            'id' => ['required', 'integer', Rule::exists('product_comment')],
        ]);
        $messages = $productComment->messages();
        $customAttributes = $productComment->customAttributes();
        $validator = Validator::make($request->all(), $rules, $messages, $customAttributes);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = $productComment::find($request->id);
        $model->fill($request->all());
        if ($model->save())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessUpdated'),
                'data' => $model,
                'log' => sprintf('[%s][%s][id:%s]', __('admin.SuccessUpdated'), $productComment->tableComments, $model->id)
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product\ProductComment  $productComment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, ProductComment $productComment)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required',],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $ids = is_array($request->id) ? $request->id : [$request->id];
        $model = $productComment::whereIn('id', $ids);
        if ($model->delete())
        {
            return [
                'code' => 200,
                'message' => __('admin.SuccessDestroyed'),
                'log' => sprintf('[%s][%s]『id:%s』', __('admin.SuccessDestroyed'), $productComment->tableComments, json_encode($ids))
            ];
        } else
        {
            return ['code' => 5001, 'message' => __('admin.Server internal error')];
        }
    }

    public function approve(Request $request, ProductComment $productComment)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required', Rule::exists('product_comment')->whereIn('status', [2, 3])],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = ProductComment::find($request->id);
        $model->status = 1;
        $model->save();
        return [
            'code' => 200,
            'message' => __('審覈通過'),
            'log' => sprintf('[%s][%s]『id:%s』', __('admin.SuccessDestroyed'), $productComment->tableComments, json_encode($request->id))
        ];
    }

    public function refused(Request $request, ProductComment $productComment)
    {
        $validator = Validator::make($request->all(), [
                    'id' => ['required', Rule::exists('product_comment')->whereIn('status', [2])],
        ]);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $model = ProductComment::find($request->id);
        $model->status = 3;
        $model->save();
        return [
            'code' => 200,
            'message' => __('審覈拒絕'),
            'log' => sprintf('[%s][%s]『id:%s』', __('admin.SuccessDestroyed'), $productComment->tableComments, json_encode($request->id))
        ];
    }

}
