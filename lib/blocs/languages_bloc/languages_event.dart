abstract class LanguagesEvent {}

class LoadLanguages extends LanguagesEvent {}

class AddLanguages extends LanguagesEvent {
  final Map<String, dynamic> languages;

  AddLanguages(this.languages);
}

class RemoveLanguages extends LanguagesEvent {
  Map<String, dynamic> languages;

  RemoveLanguages(this.languages);
}
