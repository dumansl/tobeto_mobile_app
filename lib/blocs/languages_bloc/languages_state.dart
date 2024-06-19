class LanguagesState {
  final bool isLoading;
  final String? error;
  final List<Map<String, dynamic>> languages;

  LanguagesState({
    this.isLoading = false,
    this.error,
    this.languages = const [],
  });

  LanguagesState copyWith({
    bool? isLoading,
    String? error,
    List<Map<String, dynamic>>? languages,
  }) {
    return LanguagesState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      languages: languages ?? this.languages,
    );
  }
}
