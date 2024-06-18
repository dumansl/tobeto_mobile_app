class Application {
  final String title;
  final String description;
  final String status;

  Application({
    required this.title,
    required this.description,
    required this.status,
  });

  factory Application.fromFirestore(Map<String, dynamic> data) {
    return Application(
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      status: data['status'] ?? '',
    );
  }
}
