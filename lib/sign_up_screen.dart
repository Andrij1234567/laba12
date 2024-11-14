import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  final nameController = TextEditingController();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _sendSignupRequest(String name, String login, String password) async {
    final dio = Dio();

await dio.post(
      'https://myronchuk.requestcatcher.com/sign_up',
      data: {
        'name': name,
        'login': login,
        'password': password,
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Sign up', style: TextStyle(color: Colors.white)),
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
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter name';
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Name:',
                  ),
                ),
                SizedBox(height: 10.0),

                TextFormField(
                  controller: loginController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter login';
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
                    if (value == null || value.isEmpty) return 'Please enter password';
                    if (value.length < 7) return 'Password must be at least 7 characters long';
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
                      // Validate the form before sending data
                      if (formKey.currentState?.validate() ?? false) {
                        _sendSignupRequest(
                          nameController.text,
                          loginController.text,
                          passwordController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Account has been made succesful'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        // Show a message if the form data is invalid
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Invalid data'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: Text('Sign up', style: TextStyle(color: Colors.white)),
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
