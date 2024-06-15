class ForeignLanguageModel {
  final String languageName;
  final String languageLevel;

  ForeignLanguageModel(
      {required this.languageName, required this.languageLevel});

  factory ForeignLanguageModel.fromMap(Map<String, dynamic> map) {
    return ForeignLanguageModel(
      languageName: map['language_name'],
      languageLevel: map['language_level'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'language_name': languageName,
      'language_level': languageLevel,
    };
  }
}
