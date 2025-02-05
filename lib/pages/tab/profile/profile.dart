import 'package:flutter/material.dart';
import 'package:foodapp/pages/app_routes.dart';
import 'package:foodapp/services/user_service.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _showHeader = true;
  late UserService userService;
  @override
  void initState() {
    super.initState();
    userService = GetIt.instance<UserService>();
  }
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          setState(() {
            _showHeader = scrollNotification.scrollDelta! < 0;
          });
        }
        return true;
      },
      child: ListView(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            color: Colors.deepPurple,
            child: Column(
              children: [
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Hiển thị form cho phép upload ảnh
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Tên người dùng',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email: example@example.com'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Số điện thoại: 0123456789'),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Địa chỉ: Hà Nội, Việt Nam'),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Ngày sinh: 01/01/2000'),
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Mật khẩu'),
            subtitle: Text('********'),
            onTap: () {
              // Điều hướng đến trang đổi mật khẩu
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Signout'),
            onTap: () {
              userService.logout();
              context.go('/${AppRoutes.login}');
            },
          ),
        ],
      ),
    );
  }
}
