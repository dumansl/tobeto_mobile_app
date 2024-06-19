import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/languages_bloc/languages_bloc.dart';
import 'package:tobeto_mobile_app/blocs/languages_bloc/languages_event.dart';
import 'package:tobeto_mobile_app/blocs/languages_bloc/languages_state.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_column.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_dropdown_input.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_mini_card.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

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

  void _addEducationLife() {
    final projects = {
      'languageName': languageNameController.text,
      'languageLevel': languageLevelController.text,
    };
    context.read<LanguagesBloc>().add(AddLanguages(projects));
    _clearControllers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguagesBloc, LanguagesState>(
        builder: (context, state) {
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.error != null) {
        return Center(child: Text('Error: ${state.error}'));
      }
      return ListView(
        children: [
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
          )),
          InputText(
              child: CustomDropDownInput(
            onChanged: (newValue) {
              languageLevelController.text =
                  newValue ?? languageLevelController.text;
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
            text: "Ekle",
            onPressed: () {
              if (_areControllersValid()) {
                _addEducationLife();
              }
            },
          ),
          if (state.languages.isEmpty)
            const CustomColumn(
                title: "Henüz eklediğiniz bir dil bulunmamaktadır.")
          else
            ...state.languages.map((languages) {
              return InputText(
                  child: CustomMiniCard(
                imagepath: Image.asset(ImagePath.foreignLanguages),
                onpressed: () {
                  context.read<LanguagesBloc>().add(RemoveLanguages(languages));
                },
                title: languages['languageName'],
                content: languages['languageLevel'],
              ));
            })
        ],
      );
    });
  }
}
