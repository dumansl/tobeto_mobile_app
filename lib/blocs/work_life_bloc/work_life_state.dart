class WorkLifeState {
  final bool isLoading;
  final String? error;
  final List<Map<String, dynamic>> works;

  WorkLifeState({
    this.isLoading = false,
    this.error,
    this.works = const [],
  });

  WorkLifeState copyWith({
    bool? isLoading,
    String? error,
    List<Map<String, dynamic>>? works,
  }) {
    return WorkLifeState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      works: works ?? this.works,
    );
  }
}
