import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_app_train/app/general_ui/simple_loading.dart';
import 'package:movies_app_train/app/router/app_routes.dart';
import 'package:movies_app_train/auth/presentation/controller/auth_provider.dart';
import 'package:provider/provider.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          minimumSize: const Size(double.infinity, 50),
          elevation: 0.0,
        ),
        icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red),
        label: const Text('Sign up with Google'),
        onPressed: () async {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const SimpleLoading(color: Colors.white),
          );
          final authProvider = Provider.of<AuthProvider>(context, listen: false);
          authProvider.googleLogin().then((isDone) {
            Navigator.of(context).pop();
            if (isDone) {
              Navigator.pushReplacementNamed(context, AppRoutes.moviesScreen);
            }
          });
        },
      ),
    );
  }
}
