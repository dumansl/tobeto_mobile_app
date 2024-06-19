class EducationLifeState {
  final bool isLoading;
  final String? error;
  final List<Map<String, dynamic>> education;

  EducationLifeState({
    this.isLoading = false,
    this.error,
    this.education = const [],
  });

  EducationLifeState copyWith({
    bool? isLoading,
    String? error,
    List<Map<String, dynamic>>? education,
  }) {
    return EducationLifeState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      education: education ?? this.education,
    );
  }
}
