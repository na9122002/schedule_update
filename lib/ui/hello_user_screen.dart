import 'package:flutter/material.dart';
import 'package:wrok_app_1/models/users_model.dart';
import 'package:wrok_app_1/ui/authentication/auth_service.dart';
import 'package:provider/provider.dart';
class HelloUserScreen extends StatelessWidget {
  final Users? user; // Nhận đối tượng người dùng qua constructor

  const HelloUserScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello ${user?.usrName}',
              style: TextStyle(fontSize: 60),
            ),
              SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: TextButton(onPressed: (){
              Provider.of<AuthService>(context, listen: false).logout();
              }, child: Text('Đăng xuất',style: TextStyle(color: Colors.white),)),
            )
          ],
        ),
      ),
    );
  }
}
