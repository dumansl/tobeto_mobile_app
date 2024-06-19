import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/competencies_bloc/competencies_bloc.dart';
import 'package:tobeto_mobile_app/blocs/competencies_bloc/competencies_event.dart';
import 'package:tobeto_mobile_app/blocs/competencies_bloc/competencies_state.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_column.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_mini_card.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/services/user_service.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class Competencies extends StatelessWidget {
  const Competencies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompetenciesBloc(userService: UserService())..add(LoadSkills()),
      child: CompetenciesView(),
    );
  }
}

class UserRepository {
  loadSkills() {}
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
        } else if (state.error != null) {
          return Center(child: Text('Error: ${state.error}'));
        }

        return ListView(
          children: [
            InputText(
              child: CustomTextField(
                title: TobetoText.profileEditSkill,
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
            if (state.skills.isEmpty)
              const CustomColumn(title: "Henüz eklediğiniz bir yetkinliğiniz bulunmamaktadır.")
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
