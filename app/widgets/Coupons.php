<?php

namespace App\Widgets;

use App\Models\Coupon;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Widgets\BaseDimmer;
use Illuminate\Support\Facades\Auth;

class Coupons extends BaseDimmer
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        $count = Coupon::count();
        $string = trans_choice('Coupons', $count);

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-gift',
            'title'  => "{$count} {$string}",
            'text'   => "You have $count coupons in your database. Click on button below to view all coupons.",
            'button' => [
                'text' => __('Coupons'),
                'link' => route('voyager.coupons.index'),
            ],
            'image' => asset('images/coupons.png'),
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        return Auth::user()->can('browse', Voyager::model('User'));
    }
}
