<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Đăng ký</title>
    <style>
        /* Importing fonts from Google */
        /* @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap'); */

        /* Reseting */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: #ecf0f3;
        }

        .wrapper {
            max-width: 350px;
            min-height: 500px;
            margin: 80px auto;
            padding: 40px 30px 30px 30px;
            background-color: #ecf0f3;
            border-radius: 15px;
            box-shadow: 13px 13px 20px #cbced1, -13px -13px 20px #fff;
        }

        .logo {
            width: 80px;
            margin: auto;
        }

        .logo img {
            width: 100%;
            height: 80px;
            object-fit: cover;
            border-radius: 50%;
            box-shadow: 0px 0px 3px #5f5f5f,
                0px 0px 0px 5px #ecf0f3,
                8px 8px 15px #a7aaa7,
                -8px -8px 15px #fff;
        }

        .wrapper .name {
            font-weight: 600;
            font-size: 1.4rem;
            letter-spacing: 1.3px;
            padding-left: 10px;
            color: #555;
            display: flex;
            justify-content: center;
            text-align: center;
            text-transform: uppercase;
            margin: 10px 0;
        }

        .wrapper .form-field input {
            width: 100%;
            display: block;
            border: none;
            outline: none;
            background: none;
            font-size: 1.2rem;
            color: #666;
            padding: 10px 15px 10px 10px;
            /* border: 1px solid red; */
        }

        .wrapper .form-field {
            padding-left: 10px;
            margin-bottom: 20px;
            border-radius: 20px;
            box-shadow: inset 8px 8px 8px #cbced1, inset -8px -8px 8px #fff;
        }

        .wrapper .form-field .fas {
            color: #555;
        }

        .wrapper .btn {
            box-shadow: none;
            width: 100%;
            height: 40px;
            background-color: #f379a7;
            color: #fff;
            border-radius: 25px;
            box-shadow: 3px 3px 3px #b1b1b1,
                -3px -3px 3px #fff;
            letter-spacing: 1.3px;
        }

        .wrapper .btn:hover {
            background-color: #3E444A;
            border-color: #3E444A;
        }

        .wrapper a {
            text-decoration: none;
            font-size: 0.8rem;
            color: #03A9F4;
        }

        .wrapper a:hover {
            color: #039BE5;
        }

        @media(max-width: 380px) {
            .wrapper {
                margin: 30px 20px;
                padding: 40px 15px 15px 15px;
            }
        }
    </style>
</head>

<body>


    <div class="wrapper">
        <div class="logo">
            <img src="{{ asset('assets/imgs/andung.png') }}" alt="">
        </div>
        <div class=" name  ">
            An Dung Shop
        </div>
        <form class="p-3 mt-3" method="POST" action="/register">
            @csrf
            <div>
                {{-- @if ($errors->any())
                    <span>
                        @error('Sai')
                            <li>{{ $message }}</li>
                        @enderror
                    </span>
                @endif --}}
            </div>
            <div class="form-field d-flex align-items-center">
                {{-- <span class="fa fa-user"> --}}
                <i class="fa fa-user" aria-hidden="true"></i>
                {{-- </span> --}}
                <input type="text" name="name" id="username" placeholder="Tên đăng nhập" autocomplete="off"
                    required value="{{old('name')}}">
            </div>
            @error('name')
                <span style="color: red">{{ $message }}</span>
            @enderror
            <div class="form-field d-flex align-items-center">
                <span class="fas fa-phone"></span>
                <input type="type" name="phonenumber" id="phone" placeholder="Số điện thoại " autocomplete="off"
                    required value="{{old('phonenumber')}}">
            </div>
            @error('phonenumber')
                <span style="color: red">{{ $message }}</span>
            @enderror
            <div class="form-field d-flex align-items-center">
                <span class="fas fa-email"></span>
                <input type="email" name="email" id="email" placeholder="Email" autocomplete="off" value="{{old('email')}}">
            </div>
            @error('email')
                <span style="color: red">{{ $message }}</span>
            @enderror
            <div class="form-field d-flex align-items-center">
                <span class="fas fa-key"></span>
                <input type="password" name="password" id="pwd" placeholder="Mật khẩu" autocomplete="off"
                    required>
            </div>
            @error('password')
                <span style="color: red">{{ $message }}</span>
            @enderror
            
            <button class="btn mt-3 " type="submit">Đăng ký</button>
        </form>
        {{-- <div class="text-center fs-6 mt-1">
            <a href="#">Quên mật khẩu</a> hoặc <a href="#">Đăng ký</a>
        </div> --}}
        <div id="toast-container" class="toast-top-right"></div>
    </div>

</body>

</html>
