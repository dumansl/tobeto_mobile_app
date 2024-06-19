import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/competencies_bloc/competencies_bloc.dart';
import 'package:tobeto_mobile_app/blocs/competencies_bloc/competencies_event.dart';
import 'package:tobeto_mobile_app/blocs/competencies_bloc/competencies_state.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_mini_card.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/services/user_service.dart';

class Competencies extends StatelessWidget {
  const Competencies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompetenciesBloc(userRepository: UserRepository())..add(LoadSkills()),
      child: CompetenciesView(),
    );
  }
}

class CompetenciesView extends StatelessWidget {
  final TextEditingController skillController = TextEditingController();

  CompetenciesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompetenciesBloc, CompetenciesState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.error != null) {
          return Center(child: Text('Error: ${state.error}'));
        }

        return ListView(
          children: [
            InputText(
              child: CustomTextField(
                title: "Skill",
                controller: skillController,
              ),
            ),
            CustomElevatedButton(
              text: "Ekle",
              onPressed: () {
                if (skillController.text.isNotEmpty) {
                  context.read<CompetenciesBloc>().add(AddSkill(skillController.text));
                  skillController.clear();
                }
              },
            ),
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
