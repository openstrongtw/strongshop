<?php

/**
 * StrongShop
 * @author Karen <strongshop@qq.com>
 * @license http://www.strongshop.cn/license/
 * @copyright StrongShop Software
 */

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class FeedbackReply extends Mailable
{

    use Queueable,
        SerializesModels;

    public $data;
    public $model;
    public $user;

    /**
     * 
     * @param type $user 會員
     * @param type $data 管理員回覆內容
     * @param type $model 會員反饋內容
     */
    public function __construct($user, $data, $model)
    {
        $this->user = $user;
        $this->data = $data;
        $this->model = $model;
        $this->subject(__('Feedback Replied Notification')); //郵件標題
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('emails.users.feedbackReply',);
    }

}
