import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moments/features/auth/presentation/view/registration_screen.dart';
import 'package:moments/features/auth/presentation/view_model/login/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  final Color primaryColor = const Color(0xFFEB5315);

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameOrEmailController =
        TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 150),
                SizedBox(
                  height: 140,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 10),
                const SizedBox(
                  child: Text(
                    "Stay Connected",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Cedarville',
                      color: Color.fromARGB(255, 73, 73, 73),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                SizedBox(
                  height: 45.0,
                  child: TextFormField(
                    controller: usernameOrEmailController,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                SizedBox(
                  height: 45.0,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 73, 73, 73),
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final usernameOrEmail = usernameOrEmailController.text;
                      final password = passwordController.text;
                      context.read<LoginBloc>().add(
                            LoginUserEvent(
                              context: context,
                              username: usernameOrEmail,
                              password: password,
                            ),
                          );

                      // Dispatch the login event
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEB5315), // Orange color
                      padding: const EdgeInsets.symmetric(vertical: 12), // Adjust padding if needed
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Optional: Adjust border radius
                      ),
                    ),
                    child: const Text("Sign in",

                    ),

                  ),
                ),
                const SizedBox(height: 25.0),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        "OR",
                        style: TextStyle(
                          color: Color(0xFFEB5315),

                        ),
                      ),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.all<Color>(
                          Colors.transparent), // Disable highlight color
                    ),
                    child: const Text(
                      "forgot password?",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFEB5315),
                          fontSize: 17),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        // Dispatch event to navigate to RegistrationScreen
                        context.read<LoginBloc>().add(
                              NavigateToRegisterScreenEvent(
                                context: context,
                                destination: RegistrationScreen(),
                              ),
                            );
                      },
                      style: ButtonStyle(
                        overlayColor: WidgetStateProperty.all<Color>(
                            Colors.transparent), // Disable highlight color
                      ),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            color: Color(0xFFEB5315),
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    )
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
