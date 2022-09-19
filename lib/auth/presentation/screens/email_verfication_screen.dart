import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app_train/app/router/app_routes.dart';
import 'package:movies_app_train/app/theme/app_colors.dart';
import 'package:movies_app_train/app/utils/general_functions.dart';
import 'package:movies_app_train/auth/presentation/controller/auth_provider.dart';
import 'package:provider/provider.dart';

class EmailVerficationScreen extends StatefulWidget {
  const EmailVerficationScreen({super.key});

  @override
  State<EmailVerficationScreen> createState() => _EmailVerficationScreenState();
}

class _EmailVerficationScreenState extends State<EmailVerficationScreen> {
  late AuthProvider _authProvider;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _checkEmailPeriodec();
  }

  @override
  void dispose() {
    _timer?.cancel();
    setSystemOverlayStyle(Brightness.dark);
    super.dispose();
  }

  _checkEmail() async {
    await _authProvider.reload();
    _goNext();
  }

  _checkEmailPeriodec() {
    Future.delayed(Duration.zero, () async {
      _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) async {
        await _checkEmail();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _authProvider = Provider.of<AuthProvider>(context);
    setSystemOverlayStyle(Brightness.light);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const FlutterLogo(
              size: 175,
            ),
            const Text(
              'Only one step',
              style: TextStyle(
                fontSize: 24,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 280,
              child: Text(
                'Check your email, you will receive an email with link, just click on the link..',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await _authProvider.signOut();
                _goNext();
              },
              child: const Text(
                'Return to Login',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _goNext() {
    final authState = _authProvider.authState;
    if (authState == AuthState.authenticated) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.moviesScreen);
    } else if (authState == AuthState.unAuthenticated) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreen);
    }
  }
}
