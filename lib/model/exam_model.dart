class Question {
  final String question;
  final Map<String, bool> answers;

  Question({required this.question, required this.answers});

  factory Question.fromMap(Map<String, dynamic> data) {
    return Question(
      question: data['question'] ?? '',
      answers: Map<String, bool>.from(data['answers']),
    );
  }
}

class Exam {
  final String exam;
  final String questionType;
  final List<Question> questions;
  final int duration;
  final int numberOfQuestion;

  Exam({
    required this.exam,
    required this.questionType,
    required this.questions,
    required this.duration,
    required this.numberOfQuestion,
  });

  factory Exam.fromMap(Map<String, dynamic> data) {
    return Exam(
      exam: data['exam'] ?? '',
      questionType: data['question_type'] ?? '',
      duration: data['exam_duration'] ?? 0,
      numberOfQuestion: data['number_of_question'] ?? 0,
      questions:
          (data['questions'] as List).map((q) => Question.fromMap(q)).toList(),
    );
  }
}

class UserExam {
  final String id;
  final Exam exam;
  final Map<String, int>? score;
  final bool? isCompleted;

  UserExam(
      {required this.id, required this.exam, this.score, this.isCompleted});

  factory UserExam.fromMap(Map<String, dynamic> data, String id) {
    return UserExam(
      id: id,
      exam: Exam.fromMap(data['exam']),
      score:
          data['score'] != null ? Map<String, int>.from(data['score']) : null,
      isCompleted: data['isCompleted'],
    );
  }
}
