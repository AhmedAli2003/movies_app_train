import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app_train/app/router/app_routes.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Check Youe Email',
              style: TextStyle(color: Colors.black),
            ),
            ElevatedButton(
              onPressed: () async {
                await _authProvider.signOut();
                _goNext();
              },
              child: const Text('Sign Out'),
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
