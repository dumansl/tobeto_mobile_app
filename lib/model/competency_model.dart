class CompetencyModel {
  final List<String> competencies;

  CompetencyModel({
    required this.competencies,
  });

  factory CompetencyModel.fromMap(Map<String, dynamic> map) {
    return CompetencyModel(
      competencies: List<String>.from(map['maturalist']),
    );
  }
}
