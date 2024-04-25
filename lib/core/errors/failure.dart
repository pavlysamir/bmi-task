import 'package:firebase_auth/firebase_auth.dart';

abstract class Failuer {
  final String messege;

  Failuer(this.messege);
}

class FirebaseError extends Failuer {
  FirebaseError(super.errorMessage);

  factory FirebaseError.fromException(dynamic exception) {
    if (exception is FirebaseAuthException) {
      return FirebaseError(_handleFirebaseAuthException(exception));
    } else if (exception is FirebaseException) {
      return FirebaseError(_handleFirebaseException(exception));
    } else {
      return FirebaseError(
          'An error occurred during authentication${exception}');
    }
  }

  // static String _handleFirebaseAuthException(FirebaseAuthException exception) {
  //   String errorMessage = 'An error occurred';
  //
  //   switch (exception.code) {
  //     case 'invalid-credential':
  //       errorMessage = 'Invalid or expired Google authentication credentials.';
  //       break;
  //     case 'account-exists-with-different-credential':
  //       errorMessage =
  //       'An account with this email already exists. Please sign in using a different method.';
  //       break;
  //     case 'network-request-failed':
  //       errorMessage =
  //       'Network request failed. Please check your internet connection.';
  //       break;
  //     case 'user-disabled':
  //       errorMessage =
  //       'This account has been disabled. Please contact support.';
  //       break;
  //     case 'user-not-found':
  //       errorMessage = 'User not found. Please check your email address.';
  //       break;
  //     case 'internal-error':
  //       errorMessage = 'Internal error occurred. Please try again later.';
  //       break;
  //     case 'operation-not-allowed':
  //       errorMessage = 'Google Sign-In is not enabled. Please contact support.';
  //       break;
  //     default:
  //       errorMessage = 'An error occurred while authenticating with Google.';
  //       break;
  //   }
  //
  //   return errorMessage;
  // }

  static String _handleFirebaseException(FirebaseException exception) {
    return ' ${exception.message}';
  }

  static String _handleFirebaseAuthException(FirebaseAuthException exception) {
    return ' ${exception.message}';
  }
}
