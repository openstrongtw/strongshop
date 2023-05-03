<?php

namespace App\Http\Middleware;

use Illuminate\Cookie\Middleware\EncryptCookies as Middleware;
use Illuminate\Support\Str;

class EncryptCookies extends Middleware
{

    /**
     * The names of the cookies that should not be encrypted.
     *
     * @var array
     */
    protected $except = [
        'click_num_*'
    ];

    public function isDisabled($name)
    {
        if (in_array($name, $this->except))
        {
            return true;
        }
        foreach ($this->except as $pattern)
        {
            if (Str::is($pattern, $name))
            {
                return true;
            }
        }
        return false;
    }

}
