import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/languages_bloc/languages_bloc.dart';
import 'package:tobeto_mobile_app/blocs/languages_bloc/languages_event.dart';
import 'package:tobeto_mobile_app/blocs/languages_bloc/languages_state.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_column.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_dropdown_input.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_mini_card.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_title.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/snack_bar.dart';

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  final TextEditingController languageNameController = TextEditingController();
  final TextEditingController languageLevelController = TextEditingController();

  void _clearControllers() {
    languageNameController.clear();
    languageLevelController.clear();
  }

  bool _areControllersValid() {
    return languageNameController.text.isNotEmpty &&
        languageLevelController.text.isNotEmpty;
  }

  void _addLanguage() {
    final languageData = {
      'languageName': languageNameController.text,
      'languageLevel': languageLevelController.text,
    };
    context.read<LanguagesBloc>().add(AddLanguages(languageData));
    _clearControllers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LanguagesBloc, LanguagesState>(
      listener: (context, state) {
        if (!state.isLoading) {
          if (state.error != null) {
            snackBar(context, "İşleminiz başarısız: ${state.error}");
          } else {
            snackBar(context, "İşleminiz başarılı!",
                bgColor: TobetoColor.state.success);
          }
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.error != null) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return ListView(
          children: [
            CustomTitle(title: TobetoText.profileLanguages),
            InputText(
              child: CustomDropDownInput(
                onChanged: (newValue) {
                  languageNameController.text =
                      newValue ?? languageNameController.text;
                },
                items: TobetoText.languageList
                    .map((label) => DropdownMenuItem(
                          value: label,
                          child: Text(label),
                        ))
                    .toList(),
                title: TobetoText.profileEditLanguageName,
                controller: languageNameController,
              ),
            ),
            InputText(
              child: CustomDropDownInput(
            onChanged: (newValue) {
              languageLevelController.text = newValue ?? languageLevelController.text;
            },
            items: TobetoText.languageLevel
                .map((label) => DropdownMenuItem(
                      value: label,
                      child: Text(label),
                    ))
                .toList(),
            title: TobetoText.profileEditLanguageLevel,
            controller: languageLevelController,
          )),
          CustomElevatedButton(
            onPressed: () {
              if (_areControllersValid() &&
                  state.languages.length < 4 &&
                  !state.languages.toString().contains(languageNameController.text)) {
                _addEducationLife();
              } else if (state.languages.toString().contains(languageNameController.text)) {
                snackBar(context, TobetoText.alertLanguage);
              } else if (state.languages.length >= 4) {
                snackBar(context, TobetoText.maxLanguage);
              }
            },
          ),
          if (state.languages.isEmpty)
            CustomColumn(title: TobetoText.emptyLanguage)
          else
            ...state.languages.map((languages) {
              return InputText(
                  child: CustomMiniCard(
                imagepath: Image.asset(ImagePath.foreignLanguages),
                onpressed: () {
                  context.read<LanguagesBloc>().add(RemoveLanguages(languages));
                },
                items: TobetoText.languageLevel
                    .map((label) => DropdownMenuItem(
                          value: label,
                          child: Text(label),
                        ))
                    .toList(),
                title: TobetoText.profileEditLanguageLevel,
                controller: languageLevelController,
              ),
            ),
            CustomElevatedButton(
              onPressed: () {
                if (_areControllersValid()) {
                  _addLanguage();
                }
              },
            ),
            if (state.languages.isEmpty)
              CustomColumn(title: TobetoText.emptyLanguage)
            else
              ...state.languages.map((language) {
                return InputText(
                  child: CustomMiniCard(
                    imagepath: Image.asset(ImagePath.foreignLanguages),
                    onpressed: () {
                      context
                          .read<LanguagesBloc>()
                          .add(RemoveLanguages(language));
                    },
                    title: language['languageName'],
                    content: language['languageLevel'],
                  ),
                );
              }),
          ],
        );
      },
    );
  }
}
