abstract class AppError {
  final String message;

  AppError(this.message);
}

class NoInternetAppError extends AppError {
  NoInternetAppError(String message) : super(message);
}

class NoServiceAppError extends AppError {
  NoServiceAppError(String message) : super(message);
}

class InvalidFormatAppError extends AppError {
  InvalidFormatAppError(String message) : super(message);
}

class UnknownAppError extends AppError {
  UnknownAppError(String message) : super(message);
}
