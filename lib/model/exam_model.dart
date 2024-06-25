class Exam {
  final String exam;
  final String examId;
  final int examDuration;
  final int numberOfQuestions;
  final List<Question> questions;
  final String questionType;

  Exam({
    required this.exam,
    required this.examId,
    required this.examDuration,
    required this.numberOfQuestions,
    required this.questions,
    required this.questionType,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    var questionsFromJson = json['question'] as List;
    List<Question> questionList = questionsFromJson
        .map((question) => Question.fromJson(question))
        .toList();

    return Exam(
      exam: json['exam'] ?? '',
      examId: json['exam_id'].toString(), // Ensure this is converted to string
      examDuration: json['exam_duration'] ?? 0,
      numberOfQuestions: json['number_of_question'] ?? 0,
      questions: questionList,
      questionType: json['question_type'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Exam{exam: $exam, examId: $examId, examDuration: $examDuration, numberOfQuestions: $numberOfQuestions, questions: $questions, questionType: $questionType}';
  }
}

class Question {
  final String question;
  final Map<String, bool> answers;

  Question({
    required this.question,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'] ?? '',
      answers: Map<String, bool>.from(json['answers'] ?? {}),
    );
  }

  @override
  String toString() {
    return 'Question{question: $question, answers: $answers}';
  }
}
