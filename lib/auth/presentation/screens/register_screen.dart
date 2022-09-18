import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:movies_app_train/app/di.dart';
import 'package:movies_app_train/app/router/app_routes.dart';
import 'package:movies_app_train/app/theme/app_colors.dart';
import 'package:movies_app_train/auth/domain/usecases/register_with_email_and_password_usecase.dart';
import 'package:movies_app_train/auth/presentation/controller/auth_provider.dart';
import 'package:movies_app_train/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:movies_app_train/auth/presentation/widgets/auth_button.dart';
import 'package:movies_app_train/auth/presentation/widgets/google_sign_in_button.dart';
import 'package:movies_app_train/auth/presentation/widgets/my_scroll_bahavior.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform;
  late AuthProvider _authProvider;
  String _username = '';
  String _email = '';
  String _password = '';
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    )..addListener(() {
        setState(() {});
      });
    _transform = Tween<double>(begin: 2, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _authProvider = Provider.of<AuthProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primaryColor,
                    Colors.white,
                    AppColors.primaryColor,
                  ],
                ),
              ),
              child: Opacity(
                opacity: _opacity.value,
                child: Transform.scale(
                  scale: _transform.value,
                  child: Container(
                    width: size.width * .9,
                    height: size.width * 1.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 90,
                        ),
                      ],
                    ),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(),
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(.7),
                            ),
                          ),
                          const SizedBox(),
                          CustomTextFormField(
                            icon: Icons.person_outline,
                            hintText: 'Username...',
                            onChanged: (value) => setState(() => _username = value),
                          ),
                          CustomTextFormField(
                            icon: Icons.email_outlined,
                            hintText: 'Email...',
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) => setState(() => _email = value),
                          ),
                          CustomTextFormField(
                            icon: Icons.person_outline,
                            hintText: 'Password...',
                            obscureText: true,
                            onChanged: (value) => setState(() => _password = value),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AuthButton(
                                width: 150,
                                onTap: () async {
                                  await _authProvider.registerWithEmailAndPassword(
                                    username: _username,
                                    email: _email,
                                    password: _password,
                                  );
                                  // await _authProvider.sendEmailVerfication();
                                  await FirebaseAuth.instance.currentUser!.sendEmailVerification();
                                  _goNext();
                                },
                                text: 'REGISTER',
                              ),
                              SizedBox(width: size.width / 25),
                              Container(
                                width: size.width / 2.6,
                                alignment: Alignment.center,
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Already have account?',
                                    style: const TextStyle(color: Colors.blueAccent),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreen);
                                      },
                                  ),
                                ),
                              )
                            ],
                          ),
                          const GoogleSignInButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _goNext() {
    final authState = _authProvider.authState;
    if (authState == AuthState.emailNotVerified) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.emailVerficationScreen);
    }
  }
}
