@extends('admin.components.dashboard')
@section('content')
    <div class="row mt-3 gap-2 justify-content-center ">
        <div class="col-3  h-auto p-lg-3 " style="border: 1px solid black;">
            Đơn hàng mới hôm nay: {{ $newOrder }}
        </div>
        <div class="col-3  h-auto p-lg-3 " style="border: 1px solid black;">
            Doanh thu ngày hôm nay : {{ number_format($dt->doanhthu, 2, '.', ',') }}đ
        </div>
        <div class="col-3  h-auto p-lg-3 " style="border: 1px solid black;">
            Tổng danh thu theo thời gian : {{ number_format($totalRevenue, 2, '.', ',') }}đ
        </div>
        <div class="col-3  h-auto p-lg-3 " style="border: 1px solid black;">
            Số tài khoản mới : {{ $newUser }}
        </div>

    </div>

    <div class="row mt-4">
        <div class="col-sm-12 ">
            <canvas id="revenueChart" width="800" height="400"></canvas>
        </div>
    </div>
    <div class="row mt-5">

        <div class="mb-4">
            <form action="{{ route("dashboard") }}" method="get">
                <div class="row">
                    <div class="col-2">
                        <label for="exampleInputEmail1" class="form-label">Từ ngày</label>
                        <input type="date" value="{{ $startDate }}" name="startDate" class="form-control">
                    </div>
                    <div class="col-2">
                        <label for="" class="form-label">Đến ngày</label>
                        <input type="date" value="{{ $endDate }}" name="endDate" class="form-control">
                    </div>
                    <div class="col-1">
                        <button type="submit" class="btn btn-info mt-4">Lọc</button>
                    </div>
                </div>
            </form>
        </div>
        @if (count($hotProduct) > 0)
            <h3 class="w-100 d-flex justify-content-center text-success">Top 3 sản phẩm bán chạy nhất</h3>
            <table class="table table-responsive-sm table-bordered   ">
                <thead class="text-center ">
                    <tr>
                        <th class="fw-bold ">Tên sản phẩm</th>
                        <th class="fw-bold ">Số lượng bán được</th>
                        <th class="fw-bold ">Doanh thu</th>
                    </tr>
                </thead>
                @foreach ($hotProduct as $item)
                    <tbody>
                        <tr>
                            <td style="width: 65%;">{{ $item->name }}</td>
                            <td class="text-center ">{{ $item->soluong }}</td>
                            <td class="text-center ">{{ $item->doanhthu }}</td>
                        </tr>
                    </tbody>
                @endforeach
            </table>

            <div class="mt-5 mb-5">
                <h3 class="w-100 d-flex justify-content-center text-warning">Top 3 sản phẩm bán chậm</h3>
                <table class="table table-responsive-sm table-bordered   ">
                    <thead class="text-center ">
                        <tr>
                            <th class="fw-bold ">Tên sản phẩm</th>
                            <th class="fw-bold ">Số lượng bán được</th>
                            <th class="fw-bold ">Doanh thu</th>
                        </tr>
                    </thead>
                    @foreach ($slowProducts as $item)
                        <tbody>
                            <tr>
                                <td style="width: 65%;">{{ $item->name }}</td>
                                <td class="text-center ">{{ $item->soluong }}</td>
                                <td class="text-center ">{{ $item->doanhthu }}</td>
                            </tr>
                        </tbody>
                    @endforeach
                </table>
            </div>
<!-- 
            <div>
                <h4 class="mt-3">Doanh Thu Theo Ngày (60 ngày gần nhất)</h4>
                <table  class="table table-responsive-sm table-bordered   ">
                    <thead class="text-center ">
                        <tr>
                            <th>Ngày</th>
                            <th>Doanh Thu</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($dailyRevenue as $day)
                            <tr>
                                <td>{{ $day->date }}</td>
                                <td>{{ number_format($day->doanhthu, 0, ',', '.') }} VND</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div> -->

            <!-- <h4 class="mt-3">Doanh Thu Theo Tháng (12 tháng gần nhất)</h4>
            <table  class="table table-responsive-sm table-bordered   ">
                <thead class="text-center ">
                    <tr>
                        <th>Tháng/Năm</th>
                        <th>Doanh Thu</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($monthlyRevenue as $month)
                        <tr>
                            <td>{{ $month->month }}/{{ $month->year }}</td>
                            <td>{{ number_format($month->doanhthu, 0, ',', '.') }} VND</td>
                        </tr>
                    @endforeach
                </tbody>
            </table> -->

            <!-- <h4 class="mt-3">Doanh Thu Theo Năm (3 năm gần nhất)</h4>
            <table  class="table table-responsive-sm table-bordered   ">
                <thead class="text-center ">
                    <tr>
                        <th>Năm</th>
                        <th>Doanh Thu</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($yearlyRevenue as $year)
                        <tr>
                            <td>{{ $year->year }}</td>
                            <td>{{ number_format($year->doanhthu, 0, ',', '.') }} VND</td>
                        </tr>
                    @endforeach
                </tbody>
            </table> -->

            {{-- <div class="mt-4">
                <h3 class="w-100 d-flex justify-content-center text-warning">Danh thu theo sản phẩm</h3>
                <table class="table table-responsive-sm table-bordered   ">
                    <thead class="text-center ">
                        <tr>
                            <th class="fw-bold ">Tên sản phẩm</th>
                            <th class="fw-bold ">Số lượng bán được</th>
                            <th class="fw-bold ">Doanh thu</th>
                        </tr>
                    </thead>
                    @foreach ($slowProducts as $item)
                        <tbody>
                            <tr>
                                <td style="width: 65%;">{{ $item->name }}</td>
                                <td class="text-center ">{{ $item->soluong }}</td>
                                <td class="text-center ">{{ $item->doanhthu }}</td>
                            </tr>
                        </tbody>
                    @endforeach
                </table>
            </div> --}}
        @else
            <h3>Chưa có đơn hàng nào trong 7 ngày</h3>
        @endif
    </div>
    <div class="row mt-4">
        <div class="col-sm-3">
            <div>
                <h4>Xem xu hướng sản phẩm theo danh mục</h4>
            </div>
            {{-- <form action="{{ route('thongke') }}" method="post"> --}}
            @csrf
            <div>
                <select class="form-select " name="ngay" id="">

                    <option value="7ngay" selected>7 ngày trước</option>
                    <option value="30ngay">1 tháng trước</option>
                    {{-- <option value="365">1 năm trước</option> --}}
                </select>
            </div>
            <div class="my-2 ">
                <select class="form-select" name="category" id="">
                    @foreach ($category as $item)
                        <option value="{{ $item->id }}">{{ $item->name }}</option>
                    @endforeach
                </select>
            </div>
            <div>
                <button class="btn btn-primary btn-sm tk" type="button">Xem</button>
            </div>
            {{-- </form> --}}

        </div>


        <div class="col-sm-9">
            <canvas id="revenueChart1" class="w-100" width="800" height="400"></canvas>
            <div class="alert-message"></div>
        </div>
    </div>
    {{-- <div class="row">
        <canvas id="revenueChart1" width="800" height="400"></canvas>
    </div> --}}
@endsection
@section('script')
    <script>
        $('input[name="start_date"]').change(function() {
            const val = $(this).val();
            $('input[name="end_date"]').prop('min', val);
        })


        let data1 = [];
        // console.log(data);
        let data = {!! json_encode($data) !!};
        for (var item in data) {
            // console.log(data[item]);
            data1.push(data[item]);
        }
        let ctx = document.getElementById('revenueChart').getContext('2d');
        let myChart = new Chart(ctx, {
            type: 'line',

            data: {
                // labels: ['Quần áo nam', 'Quần áo nữ', 'Áo khoác', 'Phụ kiện', 'Giày dép'],
                datasets: data1
            },
            options: {
                plugins: {
                    title: {
                        text: 'Xu hướng mua hàng theo danh mục 7 ngày qua',
                        display: true
                    }
                },
                scales: {
                    y: {
                        ticks: {
                            stepSize: 1, // Đặt bước tối thiểu giữa các giá trị trục Y là 1
                            beginAtZero: true // Đảm bảo rằng trục Y không bắt đầu từ 0
                        }
                    }
                }
            }
        });
        $(".tk").click(function() {
            getdatabyDM()
        })

        function getdatabyDM() {
            let selectDM = document.querySelector('select[name="category"]');
            let date = document.querySelector('select[name="ngay"]').value;
            let danhmuc = selectDM.value;
            let tendanhmuc = selectDM.options[selectDM.selectedIndex].textContent;
            let token = document.querySelector('input[name="_token"]').value;
            // console.log(danhmuc);
            $.ajax({
                type: 'post',
                url: "{{ route('thongke') }}",
                data: {
                    _token: token,
                    date: date,
                    danhmuc: danhmuc
                },
                success: function(response) {
                    // console.log(response.data);
                    // if (Array.from(response.data).length > 0) {
                    let option = {
                        plugins: {
                            title: {
                                text: `Xu hướng mua hàng theo danh mục ${tendanhmuc} ${date.replace('ngay','')} ngày qua`,
                                display: true
                            },
                        },
                        scales: {
                            y: {
                                ticks: {
                                    // stepSize: 1, // Đặt bước tối thiểu giữa các giá trị trục Y là 1
                                    beginAtZero: true // Đảm bảo rằng trục Y không bắt đầu từ 0
                                }
                            }
                        }
                    }
                    // console.table(response.data);
                    let datasets = [];
                    for (var item in response.data) {
                        // console.log(response.data[item]);
                        datasets.push(response.data[item])

                    }

                    bieudosanpham(option, datasets);
                    // } else {
                    //     let bieudo2 = document.getElementById('revenueChart1');

                    //     // Kiểm tra xem canvas đã có biểu đồ nào được tạo ra chưa
                    //     if (Chart.getChart(bieudo2)) {
                    //         // Nếu có, hủy bỏ biểu đồ trước khi tạo mới
                    //         Chart.getChart(bieudo2).destroy();
                    //     }
                    //     document.querySelector('.alert-message').textContent =
                    //         `Không có đơn hàng nào trong ${date.replace('ngay','')} thuộc danh mục ${tendanhmuc}`;
                    // }

                }
            })
        }
        getdatabyDM();

        function bieudosanpham(option, data2) {
            console.log(data2);
            let bieudo2 = document.getElementById('revenueChart1');

            // Kiểm tra xem canvas đã có biểu đồ nào được tạo ra chưa
            if (Chart.getChart(bieudo2)) {
                // Nếu có, hủy bỏ biểu đồ trước khi tạo mới
                Chart.getChart(bieudo2).destroy();
            }


            let ctx1 = bieudo2.getContext('2d');
            let myChart1 = new Chart(ctx1, {
                type: 'line',
                data: {
                    datasets: data2 // Sử dụng các đối tượng dataset đã tạo
                },
                options: option
            });
        }
    </script>
@endsection
