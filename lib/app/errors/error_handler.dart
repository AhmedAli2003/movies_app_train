import 'package:movies_app_train/app/errors/failure.dart';

class ErrorHandler {
  


  static Failure errorHandler({Object? error}) {
    return InternetConnectionFailure();
  }
}