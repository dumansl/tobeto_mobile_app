class ClubCominitiesState {
  final bool isLoading;
  final String? error;
  final List<Map<String, dynamic>> club;

  ClubCominitiesState({
    this.isLoading = false,
    this.error,
    this.club = const [],
  });

  ClubCominitiesState copyWith({
    bool? isLoading,
    String? error,
    List<Map<String, dynamic>>? club,
  }) {
    return ClubCominitiesState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      club: club ?? this.club,
    );
  }
}
