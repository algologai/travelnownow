class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, 'Invalid request');
}

class UnauthorisedExeption extends AppException {
  UnauthorisedExeption([String? message])
      : super(message, 'Unauthorised request');
}

class InvaliInputExeptions extends AppException{
   InvaliInputExeptions([String? message])
      : super(message, 'Invalid Input');
}


