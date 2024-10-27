import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mike_test_app/controller/auth_controller.dart';
import 'package:mike_test_app/view/screen/authentication/register_screen.dart';

import '../main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthController _authController = AuthController();

  late String email;

  late String password;

  bool isLoading = false;

  bool _isObscure = true;

  loginUser() async {
    setState(() {
      isLoading = true;
    });
    String result = await _authController.loginUser(email, password);
    if (result == 'success') {
      Future.delayed(Duration.zero, () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const MainScreen();
        }));

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('You are now logged in!'),
          ),
        );
      });
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });

      Future.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(result)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login Your Account",
                style: GoogleFonts.getFont(
                  'Lato',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                  fontSize: 23,
                ),
              ),
              Text(
                "To Explore Flutter with Firebase",
                style: GoogleFonts.getFont(
                  'Lato',
                  color: Colors.black,
                  fontSize: 14,
                  letterSpacing: 0.2,
                ),
              ),
              Image.asset(
                'assets/images/Illustration.png',
                width: 200,
                height: 200,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Email',
                  style: GoogleFonts.getFont(
                    'Nunito Sans',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your email';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 217, 231, 235),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  labelText: 'Enter your email',
                  labelStyle: GoogleFonts.getFont(
                    'Nunito Sans',
                    fontSize: 14,
                    letterSpacing: 0.1,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'assets/icons/email.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: _isObscure,
                onChanged: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your password';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 217, 231, 235),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  labelText: 'Enter your password',
                  labelStyle: GoogleFonts.getFont(
                    'Nunito Sans',
                    fontSize: 14,
                    letterSpacing: 0.1,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'assets/icons/password.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // print(email);
                    // print(password);
                    loginUser();
                  } else {
                    print("Failed");
                  }
                },
                child: Container(
                  width: 319,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF102DE1),
                        Color(0xCC0D6EFF),
                      ],
                    ),
                  ),
                  child: Center(
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'Sign in',
                            style: GoogleFonts.getFont(
                              'Lato',
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Need an Account?",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(width: 5),
                  // Adds some space between the text and the link
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()),
                      );
                    },
                    child: Text(
                      "Sign up",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF102DE1),
                      ),
                    ),
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
