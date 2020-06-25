class RepositoryResult<T, E> {
  final T success;
  final E error;

  RepositoryResult(this.success, this.error);
}
