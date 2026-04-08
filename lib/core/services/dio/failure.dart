class Failure {
  final String message;
  final int? statusCode;
  Failure({required this.message, this.statusCode});
}

class ApiFailure extends Failure {
  ApiFailure({required super.message, super.statusCode});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.message, super.statusCode});
}

class CacheFailure extends Failure {
  CacheFailure({required super.message, super.statusCode});
}

class ParseFailure extends Failure {
  ParseFailure({required super.message, super.statusCode});
}

class UnknownFailure extends Failure {
  UnknownFailure({required super.message, super.statusCode});
}
