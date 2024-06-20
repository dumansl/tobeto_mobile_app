class SurveyModel {
  final String title;
  final String question;
  final List<String> options;
  String? selected;

  SurveyModel({
    required this.title,
    required this.question,
    required this.options,
    this.selected,
  });

  // Firestore verisini SurveyModel nesnesine dönüştürmek için fromMap fonksiyonu
  factory SurveyModel.fromMap(Map<String, dynamic> data) {
    return SurveyModel(
      title: data['title'] ?? '',
      question: data['question'] ?? '',
      options: List<String>.from(data['options'] ?? []),
    );
  }

  // SurveyModel nesnesini Firestore formatına dönüştürmek için toMap fonksiyonu
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'question': question,
      'options': options,
    };
  }
}
