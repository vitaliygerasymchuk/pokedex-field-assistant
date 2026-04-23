sealed class Result<T> {
  const Result();

  static Future<Result<T>> guard<T>(Future<T> Function() task) async {
    try {
      return Success(await task());
    } catch (error, stackTrace) {
      return Failure(error, stackTrace);
    }
  }
}

final class Success<T> extends Result<T> {
  const Success(this.data);

  final T data;
}

final class Failure<T> extends Result<T> {
  const Failure(this.error, [this.stackTrace]);

  final Object error;
  final StackTrace? stackTrace;
}