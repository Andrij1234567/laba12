import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'sign_up_screen.dart';
import 'reset_password_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> _sendLoginRequest(String login, String password) async {
    final dio = Dio();
await dio.post(
      'https://myronchuk.requestcatcher.com/sign_in',
      data: {
        'login': login,
        'password': password,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final loginController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Log in', style: TextStyle(color: Colors.white)),
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
                  controller: loginController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Будь ласка, введіть логін';
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Login:',
                  ),
                ),
                SizedBox(height: 10.0),

                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Будь ласка, введіть пароль';
                    if (value.length < 7) return 'Пароль повинен містити принаймні 7 символів';
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Password:',
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {

                      if (formKey.currentState?.validate() ?? false) {
                        _sendLoginRequest(
                          loginController.text,
                          passwordController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Succesful log in'),
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
                    child: Text('Log in', style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 10.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                        },
                        child: Text('Sign up', style: TextStyle(color: Colors.blue)),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResetPasswordScreen(),
                            ),
                          );
                        },
                        child: Text('Reset password', style: TextStyle(color: Colors.blue)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
