Future<T> handleErrors<T>({
  required Future<T> Function() operation,
  required void Function(Exception e) onError,
}) async {
  try {
    return await operation();
  } catch (e) {
    if (e is Exception) {
      onError(e);
    } else {
      onError(Exception('Unexpected error occurred.'));
    }
    rethrow;
  }
}
