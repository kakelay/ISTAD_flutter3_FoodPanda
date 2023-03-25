class AppException implements Exception {
  final message;
  final prefix;
  AppException({this.message, this.prefix});

  @override
  String toString() {
    return 'AppException {message:$message ,prefix"$prefix}';
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? message)
      : super(message: message, prefix: 'Error During communition ,please check your internet');
}

class UnAuthorizedException extends AppException{
  UnAuthorizedException(String? message)
  :super(message: message,prefix: ' Your are not authorized with this request');
}