class FAQCategory {
  final List<String> questions;
  final List<String> answers;

  FAQCategory({required this.questions, required this.answers});

  factory FAQCategory.fromMap(Map<String, dynamic> data) {
    return FAQCategory(
      questions: List<String>.from(data['questions']),
      answers: List<String>.from(data['answers']),
    );
  }

  @override
  String toString() {
    return 'FAQCategory(questions: $questions, answers: $answers)';
  }
}
