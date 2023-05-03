<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Auth\AuthenticationException;
use App\Repositories\AuthRepository;

class Authenticate extends Middleware
{

    public function handle($request, Closure $next, ...$guards)
    {
        if ($this->authenticate($request, $guards) === false)
        {
            return response()->json(['code' => 401, 'message' => __('Please sign in')]);
        }
        if (in_array('api', $guards))
        {
            $user = auth('api')->user();
            if ($user->api_token_at && now()->gte($user->api_token_at))
            {
                return response()->json(['code' => 431, 'message' => __('token expired 已過期')]);
            }
            if ($user->api_token_refresh_at && now()->gte($user->api_token_refresh_at))
            {
                return response()->json(['code' => 432, 'message' => __('token must be refreshed 請重新整理token')]);
            }
        }
        return $next($request);
    }

    protected function authenticate($request, array $guards)
    {
        if (empty($guards))
        {
            $guards = [null];
        }

        foreach ($guards as $guard)
        {
            if ($this->auth->guard($guard)->check())
            {
                return $this->auth->shouldUse($guard);
            }
        }

        return $this->unauthenticated($request, $guards);
    }

    protected function unauthenticated($request, array $guards)
    {
        if ($request->expectsJson() || array_search('api', $guards) !== false)
        {
            return false;
        }
        throw new AuthenticationException(
                        'Unauthenticated.', $guards, $this->redirectTo($request)
        );
    }

    /**
     * Get the path the user should be redirected to when they are not authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string|null
     */
    protected function redirectTo($request)
    {
        return route('login');
    }

}
