class Success {
  int code;
  Object response;
  Success({required this.code, required this.response});
}

class Failure {
  int? code;
  Object errorResponse;
  Failure({required this.errorResponse});
}

class AuthSuccess {
  int? status;
  Object response;
  AuthSuccess({ required this.response});
}

class AuthFailure {
  int? status;
  Object response;
  AuthFailure({ required this.response});
}
