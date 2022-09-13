abstract class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}

class InternetConnectionFailure extends Failure {
  const InternetConnectionFailure(super.errorMessage);
}
