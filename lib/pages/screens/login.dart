import 'package:flutter/material.dart';
import 'package:nutri_scan/pages/components/mybutton.dart';
import 'package:nutri_scan/pages/homepage.dart';
import 'package:nutri_scan/pages/screens/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passWordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passWordController.dispose();

    super.dispose();
  }

  //sign up
  void signUpScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }

  //login btn
  void loginBtn() {
    // if (_formkey.currentState!.validate()) {
    //   _formkey.currentState!.save();
    // }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  //checking for text obscurity
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: SizedBox(
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //login text
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Welcome back,NutriScan helps you know the food allergens",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  //emai field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Color(0x0fffffff),
                          ),
                        ),
                        hintText: 'Enter E-mail',
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      validator: (mail) {
                        return !mail!.contains("@")
                            ? "Please enter a valid e-mail"
                            : null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),

                  //password field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: passWordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        hintStyle: const TextStyle(color: Colors.white),
                        suffixIconColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      validator: (password) {
                        if (password == null || password.trim().isEmpty) {
                          return 'This field is required';
                        }
                        if (password.trim().length < 8) {
                          return 'Password must be at least 8 characters in length';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  //submit btn
                  MyButton(
                    onTap: () => loginBtn(),
                    child: const Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  //sign up session
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      GestureDetector(
                        child: const Text(
                          "  Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () => signUpScreen(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
