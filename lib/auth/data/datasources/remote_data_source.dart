import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/constants/app_values.dart';
import 'package:movies_app_train/auth/data/models/app_user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  });
  Future<UserCredential> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<UserCredential> signInWithGoogle();
  Future<Unit> resetPassword(String email);
  Future<Unit> sendEmailVerfication();
  Future<Unit> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final googleSignIn = GoogleSignIn();

  String _getUid(UserCredential user) {
    return user.user!.uid;
  }

  @override
  Future<UserCredential> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    UserCredential user = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return user;
  }

  @override
  Future<UserCredential> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    UserCredential user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final userId = _getUid(user);
    final userModel = AppUserModel(
      idM: userId,
      usernameM: username,
      emailM: email,
      passwordM: password,
      favoritesM: AppValues.detailedMovieModels,
      watchedM: AppValues.detailedMovieModels,
      wantToWatchM: AppValues.detailedMovieModels,
      dontWantToWatchM: AppValues.detailedMovieModels,
    );
    await _firestore.collection(AppConstants.users).doc(userId).set(userModel.toJson());
    return user;
  }

  @override
  Future<Unit> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
    return unit;
  }

  @override
  Future<Unit> sendEmailVerfication() async {
    await _auth.currentUser!.sendEmailVerification();
    return unit;
  }

  @override
  Future<Unit> signOut() async {
    await _auth.signOut();
    return unit;
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    final selectedAccount = await googleSignIn.signIn();
    final googleAuth = await selectedAccount!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    final userId = _getUid(userCredential);
    final user = userCredential.user!;
    if (await _isNewUser(user)) {
      final userModel = AppUserModel(
        idM: userId,
        usernameM: user.displayName,
        emailM: user.email,
        passwordM: AppValues.empty,
        favoritesM: AppValues.detailedMovieModels,
        watchedM: AppValues.detailedMovieModels,
        wantToWatchM: AppValues.detailedMovieModels,
        dontWantToWatchM: AppValues.detailedMovieModels,
      );
      await _firestore.collection(AppConstants.users).doc(userId).set(userModel.toJson());
    }
    return userCredential;
  }

  Future<bool> _isNewUser(User user) async {
    final result = await _firestore.collection(AppConstants.users).where(AppConstants.id, isEqualTo: user.uid).get();
    return result.docs.isEmpty;
  }
}
