class CompetenciesState {
  final List<String> skills;
  final bool isLoading;
  final String? error;

  CompetenciesState({
    this.skills = const [],
    this.isLoading = false,
    this.error,
  });

  CompetenciesState copyWith({
    List<String>? skills,
    bool? isLoading,
    String? error,
  }) {
    return CompetenciesState(
      skills: skills ?? this.skills,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
