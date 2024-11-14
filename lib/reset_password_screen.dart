import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  final emailController = TextEditingController();

  Future<void> _resetPassword(String email) async {
    final dio = Dio();

await dio.post(
      'https://myronchuk.requestcatcher.com/reset_password', // Replace with actual reset password API endpoint
      data: {
        'email': email,
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Reset password', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(size: 80.0),
                SizedBox(height: 20.0),

                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    } else if (!RegExp(r'^[\w-]+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Email:',
                  ),
                ),
                SizedBox(height: 20.0),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        _resetPassword(emailController.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Password send on your email'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Invalid data'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Text('Reset', style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 10.0),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Back', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
