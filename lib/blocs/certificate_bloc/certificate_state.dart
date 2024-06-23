class CertificateState {
  final bool isLoading;
  final String? error;
  final List<Map<String, dynamic>> certificate;

  CertificateState({
    this.isLoading = false,
    this.error,
    this.certificate = const [],
  });

  CertificateState copyWith({
    bool? isLoading,
    String? error,
    List<Map<String, dynamic>>? certificate,
  }) {
    return CertificateState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      certificate: certificate ?? this.certificate,
    );
  }
}
