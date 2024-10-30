import 'package:flutter/material.dart';
import 'package:wrok_app_1/SQLite/sqlite.dart';
import 'package:wrok_app_1/models/users_model.dart';
import 'package:wrok_app_1/ui/authentication/auth_service.dart';
import 'package:wrok_app_1/ui/authentication/signup_screen.dart';
import 'package:wrok_app_1/ui/home_page.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoginError = false;
  bool isLoading = false;
  String username = '';
  String password = '';
  final db = DatabaseHelper();

  Future<void> login() async {
    
    setState(() {
      isLoading = true;
    });

    bool response = await db.login(username, password);

    if (response) {
      // Update the login state in AuthService
      Provider.of<AuthService>(context, listen: false).login();
       Provider.of<AuthService>(context, listen: false).setUser(
                  Users(usrPassword: password, usrName: username),
                );
      // Navigate to HomePage after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      setState(() {
        isLoginError = true; // Show error if login fails
      });
    }

    setState(() {
      isLoading = false; // Stop loading regardless of the response
    });
  }

  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      login();
    }
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    if (value.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 ký tự';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Đăng Nhập'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập Username';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: const OutlineInputBorder(),
                ),
                obscureText: true,
                validator: _validatePassword,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: isLoading ? null : _submit,
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Đăng Nhập'),
              ),
              if (isLoginError)
                const Text(
                  "Tài khoản hoặc mật khẩu chưa chính xác",
                  style: TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Bạn chưa có tài khoản?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    child: const Text("Đăng Ký"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
