class SExceptions implements Exception {
  const SExceptions([
    this.message = 'An unexpected error occurred. Please try again.',
  ]);

  factory SExceptions.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SExceptions(
          'The email address provided is invalid. Please enter a valid email.',
        );
      case 'sign_in_failed':
        return const SExceptions('Sign-in Failed. Please try again');
      case 'user-not-found':
        return const SExceptions('Invalid login details. User not found.');
      case 'wrong-password':
        return const SExceptions(
          'Incorrect password. Please check your password and try again.',
        );
      case 'invalid-password':
        return const SExceptions('Incorrect password. Please try again.');
      default:
        return SExceptions();
    }
  }

  final String message;
}
