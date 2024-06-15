class EducationModel {
  final String educationalStatus;
  final int graduationYear;
  final String section;
  final int startingYear;
  final String university;

  EducationModel({
    required this.educationalStatus,
    required this.graduationYear,
    required this.section,
    required this.startingYear,
    required this.university,
  });

  factory EducationModel.fromMap(Map<String, dynamic> map) {
    return EducationModel(
      educationalStatus: map['educational_status'],
      graduationYear: map['graduation_year'],
      section: map['section'],
      startingYear: map['starting_year'],
      university: map['university'],
    );
  }
}
