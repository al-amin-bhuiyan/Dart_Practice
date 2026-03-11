// Custom Exception and Failure class hierarchy
// Inspired by taghyeer_project/lib/core/errors/

// ──────────────────────────────────────────────────────────────
// EXCEPTIONS — thrown at the data layer (e.g. from API or cache)
// ──────────────────────────────────────────────────────────────

class ServerException implements Exception {
  final String message;
  final int? statusCode;
  ServerException({required this.message, this.statusCode});

  @override
  String toString() =>
      "ServerException(statusCode: $statusCode, message: $message)";
}

class NetworkException implements Exception {
  final String message;
  NetworkException({required this.message});

  @override
  String toString() => "NetworkException(message: $message)";
}

class CacheException implements Exception {
  final String message;
  CacheException({required this.message});

  @override
  String toString() => "CacheException(message: $message)";
}

// ──────────────────────────────────────────────────────────────
// FAILURES — returned at the domain/presentation layer
// (safer than throwing; use with Either<Failure, T>)
// ──────────────────────────────────────────────────────────────

abstract class Failure {
  final String message;
  const Failure({required this.message});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});

  @override
  String toString() => "ServerFailure(message: $message)";
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message});

  @override
  String toString() => "NetworkFailure(message: $message)";
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});

  @override
  String toString() => "CacheFailure(message: $message)";
}

// ──────────────────────────────────────────────────────────────
// Demo: converting exceptions to failures at the repository layer
// ──────────────────────────────────────────────────────────────

Failure handleException(Exception e) {
  if (e is ServerException) {
    return ServerFailure(message: e.message);
  } else if (e is NetworkException) {
    return NetworkFailure(message: e.message);
  } else if (e is CacheException) {
    return CacheFailure(message: e.message);
  }
  return ServerFailure(message: "Unknown error occurred");
}

void main() {
  // Throwing and catching custom exceptions
  try {
    throw ServerException(message: "Internal Server Error", statusCode: 500);
  } on ServerException catch (e) {
    print("Caught: $e");
    Failure failure = handleException(e);
    print("Mapped to: $failure");
  }

  try {
    throw NetworkException(message: "No internet connection");
  } on NetworkException catch (e) {
    print("\nCaught: $e");
    Failure failure = handleException(e);
    print("Mapped to: $failure");
  }

  try {
    throw CacheException(message: "Cache data not found");
  } on CacheException catch (e) {
    print("\nCaught: $e");
    Failure failure = handleException(e);
    print("Mapped to: $failure");
  }
}
