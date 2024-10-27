import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/auth_controller.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  bool isLoading = false;
  late String email;
  late String name;
  late String password;
  bool _isObscure = true;
  registerUser() async {
    BuildContext localContext = context;

    setState(() {
      isLoading = true;
    });

    String res = await _authController.registerNewUser(email, name, password);
    if (res == 'success') {
      Future.delayed(Duration.zero, () {
        Navigator.push(localContext, MaterialPageRoute(builder: (context) {
          return const LoginScreen();
        }));
        ScaffoldMessenger.of(localContext).showSnackBar(const SnackBar(
            content: Text('Your account has been successfully created.')));
      });
    } else {
      setState(() {
        isLoading = false;
      });

      Future.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(res)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Register Your Account",
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Name',
                    style: GoogleFonts.getFont(
                      'Nunito Sans',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
                TextFormField(
                  onChanged: (value) {
                    name = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your full name';
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
                    labelText: 'Enter your full name',
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
                      registerUser();
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
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'Sign up',
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
                      "Already have an account?",
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
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: Text(
                        "Sign in",
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
      ),
    );
  }
}
