<?php

use App\Models\Carts;
use App\Models\Product;
use App\Models\Category;
use TCG\Voyager\Facades\Voyager;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\ShopController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CartsController;
use App\Http\Controllers\CouponController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\DashboardController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
view()->composer(['layouts.nav'], function ($view) {
    $categories = Category::all();
     $cartCount =Session::has('user') ? (Carts::where('user_id', Session::get('user')->id)->count()) : 0 ;
    $view->with('categories', $categories)->with( 'cartCount', $cartCount); // bind data to view
});
Route::get('/', function () {
    $featureProducts = Product::where('product_feature_id', 1)->where('sale_status_id', 2)->limit(8)->get();
    $categories = Category::all();
    $onsalesProducts = Product::where('sale_status_id',1)->limit(8)->get();
    return view('index', compact('onsalesProducts','featureProducts','categories'));
})->name('home');

Route::get('/shops', [ShopController::class, 'index'])->name('shops');
Route::get('/shops/{shop}', [ShopController::class, 'show'])->name('shops.show');


Route::get('/products/{product}', [ProductController::class, 'show'])->name('products.show');


Route::post('/carts', [CartsController::class, 'store'])->name('carts.store');
Route::get('/carts', [CartsController::class, 'index'])->name('carts.index');
Route::put('/carts/{cart}', [CartsController::class, 'update'])->name('carts.update');
Route::delete('/carts/{cart}', [CartsController::class, 'destroy'])->name('carts.destroy');

Route::get('/checkout', [CartsController::class, 'checkout'])->name('carts.checkout');
Route::post('/placeorder', [CartsController::class, 'placeOrder'])->name('carts.placeorder');
Route::get('/myorders', [CartsController::class, 'myOrders'])->name('carts.myorders');
Route::post('/ordersDetails', [CartsController::class, 'ordersDetails'])->name('carts.ordersDetails');


Route::post('/coupon',[CouponController::class, 'store'])->name('coupon.store');
Route::get('/coupon/remove',[CouponController::class, 'remove'])->name('coupon.remove');

// Route::get('/cart', function () {
//     return view('cart');
// });
// Route::get('/checkout', function () {
//     return view('checkout');
// });
Route::get('/about', function () {
    return view('about');
});
Route::get('/contact', function () {
    return view('contact');
});
// Route::get('/profile', function () {
//     return view('profile');
// })->name('profile');

// User Routes
Route::post('/users/store', [UserController::class, 'store'])->name('users.store');
Route::get('/logout', [UserController::class, 'logout'])->name('logout');
Route::post('/loginAuthenticate',[UserController::class,'Authenticate'])->name('users.Authenticate');
Route::put('/users/{user}',[UserController::class,'update'])->name('users.update');
// Route::resource('/users', UserController::class);
Route::get('/users/{user}/edit',[UserController::class,'edit'])->name('users.edit');

Route::group(['middleware'=>['user']],function(){

    Route::get('/login', [UserController::class, 'login'])->name('login');
    Route::get('/register', [UserController::class, 'create'])->name('register');

});




// 404 Page
Route::fallback(function (){
    return view('notFound');
});

//dashboard routes


// Route::get('admin/users', function () {
//     return view('admin.users');
// })->name('admin/users');

// //start admins routes
// Route::get('admin/admins', function () {
//     return view('admin.admins.index');
// })->name('admin/admins');

// Route::get('/admin/edit', function () {
//     return view('admin.admins.edit');
// });
// Route::get('/admin/create', function () {
//     return view('admin.admins.create');
// });

// Route::get('admin/addquiz', function () {
//     return view('admin.add_quiz');
// })->name('admin/add_quiz');

// Route::get('admin/addqustions', function () {
//     return view('admin.add_qustions');
// })->name('admin/add_qustions');

// Route::get('admin/qustions', function () {
//     return view('admin.qustions');
// })->name('admin/add_interview_qustions');




Route::get('/dashboard' ,[DashboardController::class,'index'])->name('dashboard');
Route::group(['middleware'=>['admin']],function(){
    //dashboard
//     //users
//     Route::get('/admin/users' ,[userController::class,'index']);
//     Route::delete('/admin/user/{id}',[userController::class, 'destroy']);


//     //admins
//     Route::get('/admins',[AdminController::class, 'index']);
//     Route::post('/admins',[AdminController::class, 'store']);
//     Route::get('/admins/create', function () {
//         return view('/Admin/admins/create');
//     });
//     Route::delete('/admin/{id}',[AdminController::class, 'destroy']);
//     //Book
//     Route::get('/admin/books',[BookController::class, 'index']);
//     Route::delete('/admin/Books/delete/{id}',[BookController::class, 'destroy']);
//     Route::put('/admin/book/edit/{id}',[BookController::class, 'editState']);
//     Route::get('/admin/book/edit/{id}/edit',[BookController::class, 'edit']);
//     Route::get('/admin/posts/update',[PostController::class, 'update']);
//     //contacts
//     Route::get('/admin/contacts',[ContactController::class,'index']);
//     Route::delete('/admin/contact/delete/{id}',[ContactController::class,'destroy']);

//     //categories
//     Route::get('/admin/category',[CategoryController::class, 'index']);
//     Route::get('/admin/category/create',[CategoryController::class, 'create']);
//     Route::post('/admin/category/create',[CategoryController::class, 'store']);
//     Route::get('/admin/category/edit/{id}/edit',[CategoryController::class, 'edit']);
//     Route::put('/admin/category/edit/{id}',[CategoryController::class, 'update']);
//     Route::delete('/admin/category/delete/{id}',[CategoryController::class, 'destroy']);

//     //logout
//     Route::get('/admin/logout',[AdminController::class,'logout']);
});
// End Admin page route


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
