class SocialMediaState {
  final bool isLoading;
  final String? error;
  final List<Map<String, dynamic>> media;

  SocialMediaState({
    this.isLoading = false,
    this.error,
    this.media = const [],
  });

  SocialMediaState copyWith({
    bool? isLoading,
    String? error,
    List<Map<String, dynamic>>? media,
  }) {
    return SocialMediaState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      media: media ?? this.media,
    );
  }
}
