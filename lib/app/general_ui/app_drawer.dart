import 'package:flutter/material.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/constants/app_strings.dart';
import 'package:movies_app_train/app/general_ui/drawer_raw.dart';
import 'package:movies_app_train/app/general_ui/simple_loading.dart';
import 'package:movies_app_train/app/router/app_routes.dart';
import 'package:movies_app_train/auth/presentation/controller/auth_provider.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;
  final String screenRoute;
  AppDrawer(this.screenRoute, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    goNext() {
      Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.loginScreen, (route) => false);
    }

    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(color: primary, boxShadow: const [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: active,
                      ),
                      onPressed: () {
                        Scaffold.of(context).closeDrawer();
                      },
                    ),
                  ),
                  const FlutterLogo(
                    size: 90,
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    user.displayName!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    user.email!,
                    style: TextStyle(color: active, fontSize: 16.0),
                  ),
                  const SizedBox(height: 40.0),
                  DrawerRow(
                    icon: Icons.home_rounded,
                    title: 'Home',
                    isActive: screenRoute == AppRoutes.moviesScreen,
                    onTap: () {},
                  ),
                  _buildDivider(),
                  DrawerRow(
                    icon: Icons.ondemand_video_rounded,
                    title: 'Now Playing',
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.detailsListMoviesScreen,
                        arguments: AppString.nowPlaying,
                      );
                    },
                  ),
                  _buildDivider(),
                  DrawerRow(
                    icon: Icons.favorite_rounded,
                    title: 'Favorites',
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.userMoviesScreen,
                        arguments: AppConstants.favorites,
                      );
                    },
                  ),
                  _buildDivider(),
                  DrawerRow(
                    icon: Icons.playlist_add_check_rounded,
                    title: 'To watch later',
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.userMoviesScreen,
                        arguments: AppConstants.wantToWatch,
                      );
                    },
                  ),
                  _buildDivider(),
                  DrawerRow(
                    icon: Icons.add_task_rounded,
                    title: 'Watched',
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.userMoviesScreen,
                        arguments: AppConstants.watched,
                      );
                    },
                  ),
                  _buildDivider(),
                  DrawerRow(
                    icon: Icons.email_rounded,
                    title: 'Contact us',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  DrawerRow(
                    icon: Icons.info_outline_rounded,
                    title: 'Help',
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          content: Container(
                            color: Colors.white,
                            width: 150,
                            height: 250,
                            child: const SimpleLoading(),
                          ),
                        ),
                      );
                    },
                  ),
                  _buildDivider(),
                  DrawerRow(
                    icon: Icons.logout_rounded,
                    title: 'Sign out',
                    onTap: () async {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => const SimpleLoading(color: Colors.white),
                      );
                      await authProvider.signOut();
                      goNext();
                    },
                  ),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4), size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
