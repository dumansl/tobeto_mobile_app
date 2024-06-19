class ProjectsPrizeState {
  final bool isLoading;
  final String? error;
  final List<Map<String, dynamic>> projects;

  ProjectsPrizeState({
    this.isLoading = false,
    this.error,
    this.projects = const [],
  });

  ProjectsPrizeState copyWith({
    bool? isLoading,
    String? error,
    List<Map<String, dynamic>>? projects,
  }) {
    return ProjectsPrizeState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      projects: projects ?? this.projects,
    );
  }
}
