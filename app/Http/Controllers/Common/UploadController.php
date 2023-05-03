<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Http\Controllers\Common;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Storage;

class UploadController extends Controller
{

    public function image(Request $request)
    {
        $uploadLimitMimes = config('strongshop.productImage.uploadLimitMimes');
        $uploadLimitSize = config('strongshop.productImage.uploadLimitSize');
        $uploadLimitWidth = config('strongshop.productImage.uploadLimitWidth');
        $uploadLimitHeight = config('strongshop.productImage.uploadLimitHeight');
        $rules = [
            'file' => ['required', 'image', "mimes:{$uploadLimitMimes}", "max:{$uploadLimitSize}",],
            'thumb' => ['boolean'],
        ];
        //寬度限制
        if ($uploadLimitWidth > 0)
        {
            $rules = array_merge_recursive($rules, ['file' => "dimensions:width={$uploadLimitWidth}"]);
        }
        //高度限制
        if ($uploadLimitHeight > 0)
        {
            $rules = array_merge_recursive($rules, ['file' => "dimensions:height={$uploadLimitHeight}"]);
        }
        $validator = Validator::make($request->all(), $rules, ['file.dimensions' => ":attribute 尺寸不正確，限制為：{$uploadLimitWidth}x{$uploadLimitHeight}"], ['file' => '上傳圖片']);
        if ($validator->fails())
        {
            return ['code' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }

        $file = $request->file('file');

        //如果圖片大於 100kb 則 進行壓縮
        if ($file->getSize() > 1024 * 100)
        {
            if (in_array($file->extension(), ['png', 'jpg', 'gif']))
            {
                $file_type = $file->extension();
            } else
            {
                $file_type = 'jpg';
            }
            $compressed_img = (string) Image::make($file)->encode($file_type); //壓縮圖片
        } else
        {
            $compressed_img = file_get_contents($file);
        }

        //圖片數據
        $contents = $compressed_img;
        $path = $file->hashName(date('Ym')); //自定義 hash 檔名稱路徑
        Storage::disk('public')->put($path, $contents); //儲存到本地

        /*
         * 產生縮圖
         */
        $path_thumb = ''; //縮圖產生路徑名稱
        if ($request->thumb)
        {
            $thumb_suffix_name = config('strongshop.productImage.thumb.suffix_name'); //縮圖產生檔案後綴名稱
            $thumb_width = config('strongshop.productImage.thumb.width'); //縮圖產生 寬度
            $thumb_height = config('strongshop.productImage.thumb.height'); //縮圖產生 高度

            $path_arr = pathinfo($path); //路徑資訊
            $dirname = $path_arr['dirname']; //路徑
            $extension = $path_arr['extension']; //副檔名
            $filename = $path_arr['filename']; //檔名稱
            $path_thumb = $dirname . '/' . $filename . $thumb_suffix_name . '.' . $extension; //縮圖產生路徑名稱

            $img = Image::make(Storage::disk('public')->get($path));
            $_width = $img->width();
            $_height = $img->height();

            $width = $_width >= $thumb_width ? $thumb_width : $_width;
            $rate = $_width / $thumb_width; //計算縮圖比例
            $height = $thumb_height > 0 ? $thumb_height : $_height / $rate;

            //重置尺寸並存儲縮圖至本地
            $img->resize($width, $height);
            $path_thumb_contents = (string) $img->save(config('filesystems.disks.public.root') . DIRECTORY_SEPARATOR . $path_thumb);

            //縮圖資訊
            $url_thumb = Storage::disk('public')->url($path_thumb); //前端可訪問圖片url
            $url_arr_thumb = parse_url($url_thumb);
            $path_thumb = $url_arr_thumb['path'];
        }

        //圖片資訊
        $url = Storage::disk('public')->url($path); //前端可訪問圖片url
        $url_arr = parse_url($url);
        $path = $url_arr['path'];

        //儲存到七牛云
        if (config('filesystems.disks.qiniu.driver') === 'qiniu')
        {
            Storage::disk('qiniu')->put($path, $contents);
            if ($path_thumb)
            {
                Storage::disk('qiniu')->put($path_thumb, $path_thumb_contents);
            }
        }
        //儲存到阿里云
        if (config('filesystems.disks.oss.driver') === 'oss')
        {
            Storage::disk('oss')->put($path, $contents);
            if ($path_thumb)
            {
                Storage::disk('oss')->put($path_thumb, $path_thumb_contents);
            }
        }

        return ['code' => 0, 'message' => 'success',
            'data' => [
                'src' => $path,
                'src_thumb' => $path_thumb ? $path_thumb : '',
                'title' => $file->getClientOriginalName(),
            ]
        ];
    }

    /**
     * wangEditor 富文字編輯器
     * https://www.wangeditor.com/
     * @param Request $request
     * @return type
     */
    public function imageWangEditor(Request $request)
    {
        $rules = [
            'file' => ['required', 'image', 'max:' . config('strongshop.productImage.uploadLimitSize')],
        ];
        $validator = Validator::make($request->all(), $rules, [], ['file' => '上傳圖片']);
        if ($validator->fails())
        {
            return ['errno' => 3001, 'message' => $validator->errors()->first(), 'data' => $validator->errors()];
        }
        $file = $request->file('file');
        //如果圖片大於 100kb 則 進行壓縮
        if ($file->getSize() > 1024 * 100)
        {
            if (in_array($file->extension(), ['png', 'jpg', 'gif']))
            {
                $file_type = $file->extension();
            } else
            {
                $file_type = 'jpg';
            }
            $compressed_img = (string) Image::make($file)->encode($file_type); //壓縮圖片
        } else
        {
            $compressed_img = file_get_contents($file);
        }
        $contents = $compressed_img;
        $path = $file->hashName(date('Ym'));

        //儲存到本地
        Storage::disk('public')->put($path, $contents);
        
        //前端可訪問圖片url
        $url = Storage::disk('public')->url($path);
        $url_arr = parse_url($url);
        $path = $url_arr['path'];
        
        //儲存到七牛云
        if (config('filesystems.disks.qiniu.driver') === 'qiniu')
        {
            Storage::disk('qiniu')->put($path, $contents);
        }
        //儲存到阿里云
        if (config('filesystems.disks.oss.driver') === 'oss')
        {
            Storage::disk('oss')->put($path, $contents);
        }
        
        $data[] = [
            'url' => asset($path),
            'alt' => $file->getClientOriginalName(),
            'href' => '',
        ];
        return ['errno' => 0, 'message' => 'success', 'data' => $data];
    }

}
