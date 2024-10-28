import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Logic đăng ký ở đây
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đăng ký thành công!')),
      );
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

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng xác nhận mật khẩu';
    }
    if (value != _password) {
      return 'Mật khẩu không khớp';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Đăng Ký',
          style: TextStyle(color: Colors.black),
        ),
        toolbarHeight: 94,
        backgroundColor: Color(0xFFEBEBF5),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  // labelStyle: TextStyle(color: Colors.blueAccent),
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                  // suffixIcon: Icon(Icons.visibility_off), // Hoặc Icons.visibility
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập email';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  // labelStyle: TextStyle(color: Colors.blueAccent),
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                  // suffixIcon: Icon(Icons.visibility_off), // Hoặc Icons.visibility
                ),
                obscureText: true,
                validator: _validatePassword,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nhập lại mật khẩu',
                  // labelStyle: TextStyle(color: Colors.blueAccent),
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                  // suffixIcon: Icon(Icons.visibility_off), // Hoặc Icons.visibility
                ),
                obscureText: true,
                validator: _validatePassword,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Đăng Ký'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
