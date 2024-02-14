import 'package:flutter/material.dart';
import 'package:nutri_scan/pages/components/mybutton.dart';
import 'package:nutri_scan/pages/screens/login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final fullNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    @override
    void dispose() {
      fullNameController.dispose();
      emailController.dispose();
      passwordController.dispose();

      super.dispose();
    }

    // checking for password visibility
    bool isPassHidden = true;

    //login
    void loginScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }

    //sign up btn fumction
    void signUpBtn() {}

    //name field
    final nameField = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: fullNameController,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          hintText: "Enter Full name ",
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        validator: (fullname) {
          if (fullname == null || fullname.trim().isEmpty) {
            return 'Can\'t be Empty, Enter Name';
          }
          if (fullname.length < 4) {
            return 'Text too Short';
          }
          return null;
        },
      ),
    );

    //email field
    final emailField = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        decoration: InputDecoration(
          hintText: "Enter e-mail ",
          hintStyle: const TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        validator: (email) {
          return !email!.contains("@") ? "Please enter a valid e-mail" : null;
        },
      ),
    );

    //password field
    final passField = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: passwordController,
        obscureText: isPassHidden,
        decoration: InputDecoration(
          hintText: "Enter Password ",
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              // ignore: dead_code
              isPassHidden ? Icons.visibility : Icons.visibility_off,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                isPassHidden = !isPassHidden;
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
    );

    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Create a new account, it only takes about 2 minutes",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              nameField,
              const SizedBox(height: 10),
              emailField,
              const SizedBox(height: 10),
              passField,
              const SizedBox(height: 10),
              MyButton(
                onTap: () {},
                child: const Text(
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already a member."),
                  GestureDetector(
                    child: const Text(
                      "  Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () => loginScreen(),
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
