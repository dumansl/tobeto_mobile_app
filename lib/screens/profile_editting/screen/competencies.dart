import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/competencies_bloc/competencies_bloc.dart';
import 'package:tobeto_mobile_app/blocs/competencies_bloc/competencies_event.dart';
import 'package:tobeto_mobile_app/blocs/competencies_bloc/competencies_state.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_column.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_mini_card.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_title.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/snack_bar.dart';

class Competencies extends StatefulWidget {
  const Competencies({super.key});

  @override
  State<Competencies> createState() => _CompetenciesState();
}

class _CompetenciesState extends State<Competencies> {
  final TextEditingController skillController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompetenciesBloc, CompetenciesState>(
      listener: (context, state) {
        if (!state.isLoading && state.error != null) {
          snackBar(context, "İşleminiz başarısız: ${state.error}");
        } else if (!state.isLoading && state.error == null) {
          snackBar(context, "İşleminiz başarılı!",
              bgColor: TobetoColor.state.success);
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          children: [
            CustomTitle(title: TobetoText.profileMySkills),
            InputText(
              child: CustomTextField(
                title: TobetoText.profileEditSkill,
                controller: skillController,
              ),
            ),
            CustomElevatedButton(
              onPressed: () {
                String newSkill = skillController.text.trim();
                if (skillController.text.isNotEmpty && state.skills.length < 5 && !state.skills.contains(newSkill)) {
                  context.read<CompetenciesBloc>().add(AddSkill(skillController.text));
                  skillController.clear();
                } else if (state.skills.length >= 5) {
                  snackBar(context, TobetoText.maxSkill);
                } else if (state.skills.contains(newSkill)) {
                  snackBar(context, TobetoText.alertSkill);
                }
              },
            ),
            if (state.skills.isEmpty)
              CustomColumn(title: TobetoText.emptySkill)
            else
              ...state.skills.map((skill) {
                return InputText(
                  child: CustomMiniCard(
                    onpressed: () {
                      context.read<CompetenciesBloc>().add(RemoveSkill(skill));
                    },
                    title: skill,
                  ),
                );
              }),
          ],
        );
      },
    );
  }
}
