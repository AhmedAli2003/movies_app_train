import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app_train/app/di.dart';
import 'package:movies_app_train/auth/domain/entities/app_user.dart';
import 'package:movies_app_train/auth/domain/usecases/login_with_email_and_password_usecase.dart';
import 'package:movies_app_train/auth/domain/usecases/register_with_email_and_password_usecase.dart';
import 'package:movies_app_train/auth/domain/usecases/reset_password_usecase.dart';
import 'package:movies_app_train/auth/domain/usecases/send_email_verfication_usecase.dart';
import 'package:movies_app_train/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:movies_app_train/auth/domain/usecases/sign_out_usecase.dart';

enum AuthState {
  authenticated,
  authenticating,
  emailNotVerified,
  unAuthenticated,
}

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user;
  AuthState _authState = AuthState.authenticating;
  String _errorMessage = '';
  late AppUser _appUser;
  AppUser get appUser => _appUser;

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _googleUser;
  GoogleSignInAccount get googleUser => _googleUser!;


  AuthState get authState => _authState;
  User get user => _user;
  FirebaseAuth get auth => _auth;
  String get errorMessage => _errorMessage;

  AuthProvider() {
    _auth.authStateChanges().listen((user) async {
      if (user == null) {
        _authState = AuthState.unAuthenticated;
      } else {
        await user.reload();
        if (!user.emailVerified) {
          _user = user;
          _authState = AuthState.emailNotVerified;
        } else {
          _user = user;
          _authState = AuthState.authenticated;
        }
      }
    });
    notifyListeners();
  }

  Future<void> reload() async {
    await _user.reload();
    if (_auth.currentUser!.emailVerified) {
      _authState = AuthState.authenticated;
    } else {
      _authState = AuthState.emailNotVerified;
    }
    notifyListeners();
  }

  Future<void> registerWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
  }) async {
    final register = getIt<RegisterWithEmailAndPasswordUsecase>();
    final either = await register(
      username: username,
      email: email,
      password: password,
    );
    either.fold(
      (failure) => _errorMessage = failure.errorMessage,
      (userCredential) {},
    );
    _authState = AuthState.emailNotVerified;
    notifyListeners();
  }

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final login = getIt<LoginWithEmailAndPasswordUsecase>();
    final either = await login(
      email: email,
      password: password,
    );
    either.fold(
      (failure) => _errorMessage = failure.errorMessage,
      (userCredential) {},
    );
    if (_user.emailVerified) {
      _authState = AuthState.authenticated;
    } else {
      _authState = AuthState.emailNotVerified;
    }
    notifyListeners();
  }

  Future<void> sendEmailVerfication() async {
    final send = getIt<SendEmailVerficationUsecase>();
    final either = await send();
    either.fold(
      (failure) => _errorMessage = failure.errorMessage,
      (r) => null,
    );
    notifyListeners();
  }

  Future<void> resetPassword(String email) async {
    final reset = getIt<ResetPasswordUsecase>();
    final either = await reset(email);
    either.fold(
      (failure) => _errorMessage = failure.errorMessage,
      (r) => null,
    );
    notifyListeners();
  }

  Future<void> signOut() async {
    final signOut = getIt<SignOutUsecase>();
    final either = await signOut();
    either.fold(
      (failure) => _errorMessage = failure.errorMessage,
      (r) => null,
    );
    _authState = AuthState.unAuthenticated;
    notifyListeners();
  }

  Future<bool> googleLogin() async {
    final signInWithGoogle = getIt<SignInWithGoogleUsecase>();
    final either = await signInWithGoogle();
    bool isDone = false;
    either.fold(
      (failure) => _errorMessage = failure.errorMessage,
      (userCredential) {
        isDone = true;
        _authState = AuthState.authenticated;
        return _user = userCredential.user!;
      },
    );
    notifyListeners();
    return isDone;
  }
}
