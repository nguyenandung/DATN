<?php

namespace App\Http\Controllers\ADMIN;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $order = Order::orderBy('isCancel')->orderByDesc('orderDate')->paginate(8);
        $status = 'all';
        $cash = 'all';
        // dd($order);
        return view('admin.components.Order.index', compact('order', 'status', 'cash'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $order = Order::find($id);
        // dd($order);
        return view('admin.components.Order.show', compact('order'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $order = Order::find($id);
        // dd($order);
        return view('admin.components.Order.edit', compact('order'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function changeStatus(Request $request)
    {
        $id = $request->id;
        $status = $request->status;
        $order = Order::find($id);
        if ($status == 'CHỜ XÁC NHẬN') {
            $order->status = 'Đang giao hàng';
            $order->save();
            return response()->json(['data' => 200]);
        }
        if ($status == 'ĐANG GIAO HÀNG') {
            $order->status = 'Đã giao hàng';
            $order->save();
            return response()->json(['data' => 200]);
        }
    }
    public function filter(Request $request)
    {
        // dd($request);
        $status = $request->status;
        $cash = $request->Cash;

        if ($status == 'all') {
            if ($cash == 'all') {
                $order = Order::orderBy('isCancel')->orderByDesc('orderDate')->paginate(8);
                // dd($order);
                return view('admin.components.Order.index', compact('order', 'status', 'cash'));
            } else {
                if ($cash == 'chuathanhtoan') {
                    $order = Order::where('paymentMethod', 'Thanh toán khi nhận hàng')->where('status', '<>', 'Đã nhận hàng')->orderBy('isCancel')->orderByDesc('orderDate')->paginate(8);
                    return view('admin.components.Order.index', compact('order', 'status', 'cash'));
                } else {
                    $order = Order::where('paymentMethod', 'Thanh toán qua VNPAY')->orWhere('status', 'Đã nhận hàng')->orderBy('isCancel')->orderByDesc('orderDate')->paginate(8);
                    // dd($order);
                    return view('admin.components.Order.index', compact('order', 'status', 'cash'));
                }
            }
        } else {
            if ($cash == 'all') {
                if ($status == 'choxacnhan') {
                    $order = Order::where('status', 'Chờ xác nhận')->orderByDesc('orderDate')->paginate(8);
                    return view('admin.components.Order.index', compact('order', 'status', 'cash'));
                } else if ($status == 'danggiao') {
                    $order = Order::where('status', 'Đang giao hàng')->orderByDesc('orderDate')->paginate(8);
                    return view('admin.components.Order.index', compact('order', 'status', 'cash'));
                } else {
                    // $order = Order::where("id", "100000000")->paginate(8);
                    $order = Order::where('status', 'Đã hủy')->orderByDesc('orderDate')->paginate(8);
                    return view('admin.components.Order.index', compact('order', 'status', 'cash'));
                }
            } else if ($cash == 'chuathanhtoan') {

                if ($status == 'choxacnhan') {
                    $order = Order::where('paymentMethod', 'Thanh toán khi nhận hàng')->where('status', 'Chờ xác nhận')->orderByDesc('orderDate')->paginate(8);
                    return view('admin.components.Order.index', compact('order', 'status', 'cash'));
                } else if ($status == 'danggiao') {
                    $order = Order::where('paymentMethod', 'Thanh toán khi nhận hàng')->where('status', 'Đang giao hàng')->orderByDesc('orderDate')->paginate(8);
                    return view('admin.components.Order.index', compact('order', 'status', 'cash'));
                } else if ($status == 'danhanhang') {
                    // $order = Order::where('paymentMethod', 'Thanh toán khi nhận hàng')->where('status', 'Đã nhận hàng')->orderByDesc('orderDate')->paginate(8);
                    $order = Order::where('id', '100000000000000')->where('status', '=', 'Đã nhận hàng')->orderByDesc('orderDate')->paginate(8);
                    return view('admin.components.Order.index', compact('order', 'status', 'cash'));
                } else {
                    // $order = Order::where("id", "100000000")->paginate(8);
                    $order = Order::where('paymentMethod', 'Thanh toán khi nhận hàng')->where('status', 'Đã hủy')->orderByDesc('orderDate')->paginate(8);
                    return view('admin.components.Order.index', compact('order', 'status', 'cash'));
                }
            } else {
                if ($status == 'choxacnhan') {
                    $order = Order::where('paymentMethod', 'Thanh toán qua VNPAY')->where('status', 'Chờ xác nhận')->orderByDesc('orderDate')->paginate(8);
                    return view('admin.components.Order.index', compact('order', 'status', 'cash'));
                } else if ($status == 'danggiao') {
                    $order = Order::where('paymentMethod', 'Thanh toán qua VNPAY')->where('status', 'Đang giao hàng')->orderByDesc('orderDate')->paginate(8);
                    return view('admin.components.Order.index', compact('order', 'status', 'cash'));
                } else if ($status == 'danhanhang') {
                    $order = Order::where('status', 'Đã nhận hàng')->orderByDesc('orderDate')->paginate(8);
                    return view('admin.components.Order.index', compact('order', 'status', 'cash'));
                } else {
                    $order = Order::where('paymentMethod', 'Thanh toán qua VNPAY')->where('status', 'Đã hủy')->orderByDesc('orderDate')->paginate(8);
                    return view('admin.components.Order.index', compact('order', 'status', 'cash'));
                }
            }
        }
    }
}
