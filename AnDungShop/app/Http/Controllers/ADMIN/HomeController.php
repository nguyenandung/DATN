<?php

namespace App\Http\Controllers\ADMIN;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Product;
use App\Models\User;
use App\Models\Category;
use App\Models\OrderDetail;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function AdminLogin(Request $request){
        $data = $request->all();
        // dd($data);
        if (Auth::attempt(['name'=>$data['userName'],'password'=>$data['password']])) {
            // $request->session()->regenerate();
           if(Auth::user()->role == 'admin'){
               return redirect()->route('dashboard');
           }
           else{
            toastr()->error('Bạn không có quyền');
           }
        }

        return back()->withErrors(['Sai'=>'Tài khoản hoặc mật khẩu không đúng']);
    }
    public function logout(){
        session()->forget('admin');
        return  redirect('login');
    }

    public function dashboard(Request $request)
{
    $startDate = $request->startDate ? Carbon::parse($request->startDate) : Carbon::now()->subDays(30);
    $endDate = $request->endDate ? Carbon::parse($request->endDate) : Carbon::now();

    // $products = Product::all();
    $category = Category::all();
    $data =[];
    foreach ($category as $key => $item) {
        if(!array_key_exists($item['name'], $data)){
            $newData =  $this->fillMissingDates($startDate,$endDate,$item['name']);
            $data[$item['name']] = $newData;
        }
    }
    $salesData = OrderDetail::join('order', 'orderdetail.order_id', '=', 'order.id')
                ->join('products', 'orderdetail.product_id', '=', 'products.id')
                ->join('categories', 'products.category_id', '=', 'categories.id')
                // ->where('orderdetail.product_id', $product->id)
                ->whereBetween('order.orderDate', [$startDate, $endDate])
                ->selectRaw('categories.name as category_name,DATE(order.orderDate) as date, SUM(orderdetail.quantity) as total_quantity')
                ->groupBy('category_name')
                ->groupBy('date')
                ->get();
    foreach ($salesData as $index => $item) {
        // dd(array_key_exists($item['date'],$data[$item['category_name']]['data']));

        if(array_key_exists($item['category_name'],$data)){
            // print_r($data[$item['category_name']]['data']);
            // var_dump($item['date']);
            if(array_key_exists($item['date'],$data[$item['category_name']]['data'])){
                // var_dump($item['total_quantity']);
                $data[$item['category_name']]['data'][$item['date']] = (int) $item['total_quantity'];
            }
        }
    }
    $newOrder = Order::whereRaw('DATE(orderDate) = ?',[Carbon::now()->format('Y-m-d')])->count();
    // dd($newOrder);
    $dt = OrderDetail::join('order', 'orderdetail.order_id', '=', 'order.id')
            ->whereRaw('DATE(orderDate) = ?',[Carbon::now()->format('Y-m-d')])
            ->selectRaw('sum(orderdetail.quantity * orderdetail.price) as doanhthu')
            ->first();
    $newUser = User::whereRaw('DATE(created_at) = ?',[Carbon::now()->format('Y-m-d')])->count();
            // dd($dt->doanhthu);
    $hotProduct = OrderDetail::join('order', 'orderdetail.order_id', '=', 'order.id')
                ->join('products', 'orderdetail.product_id', '=', 'products.id')
                // ->whereBetween('order.orderDate', [$startDate, $endDate])
                ->whereBetween('order.orderDate', [$startDate, $endDate])
                ->selectRaw('COUNT(orderdetail.product_id) as count, products.name,sum(orderdetail.quantity) as soluong, sum(orderdetail.quantity * orderdetail.price) as doanhthu')
                ->groupby('products.name')
                // ->orderBy('count','desc')
                ->orderBy('soluong','desc')
                // ->orderBy('doanhthu','desc')
                ->limit(3)
                ->get();


            // // Sản phẩm bán chạy (giới hạn top 3)
            // $hotProducts = OrderDetail::join('orders', 'order_details.order_id', '=', 'orders.id')
            // ->join('products', 'order_details.product_id', '=', 'products.id')
            // ->whereBetween('orders.orderDate', [$startDate, $endDate])
            // ->selectRaw('COUNT(order_details.product_id) as count, products.name, sum(order_details.quantity) as soluong, sum(order_details.quantity * order_details.price) as doanhthu')
            // ->groupBy('products.name')
            // ->orderBy('count', 'desc') // Sản phẩm bán chạy theo số lần xuất hiện trong các đơn hàng
            // ->orderBy('soluong', 'desc') // Sắp xếp theo số lượng bán
            // ->orderBy('doanhthu', 'desc') // Sắp xếp theo doanh thu
            // ->limit(3)
            // ->get();

            // Sản phẩm bán chậm (lấy top 3 sản phẩm bán chậm nhất)
            $slowProducts = OrderDetail::join('order', 'orderdetail.order_id', '=', 'order.id')
            ->join('products', 'orderdetail.product_id', '=', 'products.id')
            ->whereBetween('order.orderDate', [$startDate, $endDate])
            ->selectRaw('COUNT(orderdetail.product_id) as count, products.name, sum(orderdetail.quantity) as soluong, sum(orderdetail.quantity * orderdetail.price) as doanhthu')
            ->groupBy('products.name')
            ->orderBy('count', 'asc') // Sản phẩm bán chậm theo số lần xuất hiện trong các đơn hàng
            ->orderBy('soluong', 'asc') // Sắp xếp theo số lượng bán tăng dần
            // ->orderBy('doanhthu', 'asc') // Sắp xếp theo doanh thu tăng dần
            ->limit(3)
            ->get();

            // Tổng doanh thu trong khoảng thời gian
            $totalRevenue = OrderDetail::join('order', 'orderdetail.order_id', '=', 'order.id')
            ->whereBetween('order.orderDate', [$startDate, $endDate])
            ->sum(DB::raw('orderdetail.quantity * orderdetail.price'));

    $startDate = Carbon::parse($request->startDate)->format("Y-m-d");
    $endDate = Carbon::parse($request->endDate)->format("Y-m-d");

    $today = Carbon::today();
    $threeYearsAgo = $today->copy()->subYears(3);
    $sixtyDaysAgo = $today->copy()->subDays(60);
    $twelveMonthsAgo = $today->copy()->subMonths(12);

    // Doanh thu theo năm (3 năm gần nhất)
    $yearlyRevenue = OrderDetail::join('order', 'orderdetail.order_id', '=', 'order.id')
        ->join('products', 'orderdetail.product_id', '=', 'products.id')
        ->selectRaw('YEAR(order.orderDate) as year, SUM(orderdetail.quantity * orderdetail.price) as doanhthu')
        ->whereBetween('order.orderDate', [$threeYearsAgo, $today])
        ->groupBy('year')
        ->orderBy('year', 'desc')
        ->get();

    // Doanh thu theo tháng (12 tháng gần nhất)
    $monthlyRevenue = OrderDetail::join('order', 'orderdetail.order_id', '=', 'order.id')
        ->join('products', 'orderdetail.product_id', '=', 'products.id')
        ->selectRaw('YEAR(order.orderDate) as year, MONTH(order.orderDate) as month, SUM(orderdetail.quantity * orderdetail.price) as doanhthu')
        ->whereBetween('order.orderDate', [$twelveMonthsAgo, $today])
        ->groupBy('year', 'month')
        ->orderBy('year', 'desc')
        ->orderBy('month', 'desc')
        ->get();

    // Doanh thu theo ngày (30 ngày gần nhất)
    $dailyRevenue = OrderDetail::join('order', 'orderdetail.order_id', '=', 'order.id')
        ->join('products', 'orderdetail.product_id', '=', 'products.id')
        ->selectRaw('DATE(order.orderDate) as date, SUM(orderdetail.quantity * orderdetail.price) as doanhthu')
        ->whereBetween('order.orderDate', [$sixtyDaysAgo, $today])
        ->groupBy('date')
        ->orderBy('date', 'desc')
        ->get();
                // dd($hotProduct);
    return view('admin.components.home',compact('data','hotProduct','newOrder','dt','newUser', 'slowProducts', 'totalRevenue', 'startDate', 'endDate', 'dailyRevenue', 'monthlyRevenue', 'yearlyRevenue'));
}

private function fillMissingDates($startDate, $endDate,$label)
{
    $dateRange = $this->getDateRange($startDate, $endDate);
    $newData =[];
    $filledData = [

    ];

    foreach ($dateRange as $date) {
        $formattedDate = $date->format('Y-m-d');
        // dd($formattedDate);
        $newData[$formattedDate]= 0;
    }
    // dd($filledData);
    $filledData = [
            'label'=>$label,
            'data'=>$newData

    ];
    // dd(count($filledData));

    return $filledData;
}

private function getDateRange($startDate, $endDate)
{
    $dateRange = [];
    $currentDate = $startDate->copy();

    while ($currentDate->lte($endDate)) {
        $dateRange[] = $currentDate->copy();
        $currentDate->addDay();
    }

    return $dateRange;
}
    public function thongke(Request $request){
        $date = $request->date;
        $danhmuc_id = $request->danhmuc;


        if($date == '7ngay'){
            $startDate = Carbon::now()->subDays(8);
            $endDate = Carbon::now()->subDays(1);


        }
        else{
            $startDate = Carbon::now()->subDays(30);
            $endDate = Carbon::now()->subDays(1);
        }
        $data =  $this->getDLTK($startDate,$endDate,$danhmuc_id);
            return response()->json(['data'=>$data]);
    }
    public function getDLTK($startDate, $endDate, $danhmuc_id){
        $data =[];
        $products = Product::where('category_id',$danhmuc_id)->get();
        foreach ($products as $key => $item) {
                if(!array_key_exists($item['name'], $data)){
                    $newData =  $this->fillMissingDates($startDate,$endDate,$item['name']);
                    $data[$item['name']] = $newData;
                }
            }
            // dd($data);
            $startDate = $startDate->format('Y-m-d');
            $endDate = $endDate->format('Y-m-d');

            $salesData = OrderDetail::join('order', 'orderdetail.order_id', '=', 'order.id')
                ->join('products', 'orderdetail.product_id', '=', 'products.id')
                ->join('categories', 'products.category_id', '=', 'categories.id')
                ->whereBetween('order.orderDate', [$startDate, $endDate])
                ->where('categories.id',$danhmuc_id)
                ->selectRaw('products.name as product_name,DATE(order.orderDate) as date, sum(orderdetail.quantity * orderdetail.price) as doanhthu')
                ->groupBy('product_name')
                ->groupBy('date')
                ->get();
            foreach ($salesData as $index => $item) {
                if(array_key_exists($item['product_name'],$data)){
                    if(array_key_exists($item['date'],$data[$item['product_name']]['data'])){
                        // var_dump($item['total_quantity']);
                        $data[$item['product_name']]['data'][$item['date']] = (int) $item['doanhthu'];
                    }
                }
            }
            return $data;
    }
}
