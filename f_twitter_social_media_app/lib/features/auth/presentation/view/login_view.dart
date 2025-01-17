import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f_twitter_social_media_app/features/auth/presentation/view/register_view.dart';
import 'package:f_twitter_social_media_app/features/auth/presentation/view_model/login/login_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    // App Logo and Name
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 60,
                          width: 100,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Twitter', //
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFE5404), //
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Brand Bold',
                      ),
                    ),
                    const SizedBox(height: 50),
                    TextFormField(
                      key: const ValueKey('email'),
                      controller: _emailController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      key: const ValueKey('password'),
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      }),
                    ),
            
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(
                                LoginCustomerEvent(
                                  context: context,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Brand Bold',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<LoginBloc>().add(
                                  NavigateRegisterScreenEvent(
                                    destination: RegisterView(),
                                    context: context,
                                  ),
                                );
                          },
                          child: const Text(
                            'Create Account',
                            style: TextStyle(
                              color: Color(0xFFFE5404),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('OR'),
                        ),
                        Expanded(child: Divider(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 20),
                                        
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
