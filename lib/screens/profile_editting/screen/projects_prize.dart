import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/projects_prize_bloc/projects_prize_bloc.dart';
import 'package:tobeto_mobile_app/blocs/projects_prize_bloc/projects_prize_event.dart';
import 'package:tobeto_mobile_app/blocs/projects_prize_bloc/projects_prize_state.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_card.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_column.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_date_input.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_mini_card.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';

class ProjectsPrize extends StatefulWidget {
  const ProjectsPrize({super.key});

  @override
  State<ProjectsPrize> createState() => _ProjectsPrizeState();
}

class _ProjectsPrizeState extends State<ProjectsPrize> {
  final TextEditingController projectAwardNameController = TextEditingController();
  final TextEditingController certificatesDateController = TextEditingController();

  void _clearControllers() {
    projectAwardNameController.clear();
    certificatesDateController.clear();
  }

  bool _areControllersValid() {
    return projectAwardNameController.text.isNotEmpty && certificatesDateController.text.isNotEmpty;
  }

  void _addEducationLife() {
    final projects = {
      'projectAwardName': projectAwardNameController.text,
      'certificatesDate': certificatesDateController.text,
    };
    context.read<ProjectsPrizeBloc>().add(AddProjectsPrize(projects));
    _clearControllers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsPrizeBloc, ProjectsPrizeState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.error != null) {
        return Center(child: Text('Error: ${state.error}'));
      }
      return ListView(
        children: [
          InputText(
            child: CustomTextField(
              title: TobetoText.profileEditProjectAwardName,
              controller: projectAwardNameController,
            ),
          ),
          InputText(
            child: CustomDateInput(
                controller: certificatesDateController, labelText: TobetoText.profileEditCertificatesDate),
          ),
          CustomElevatedButton(
            text: "Ekle",
            onPressed: () {
              if (_areControllersValid()) {
                _addEducationLife();
              }
            },
          ),
          if (state.projects.isEmpty)
            const CustomColumn(title: "Henüz eklediğiniz bir proje veya ödülünüz bulunmamaktadır.")
          else
            ...state.projects.map((projects) {
              return InputText(
                  child: CustomMiniCard(
                onpressed: () {
                  context.read<ProjectsPrizeBloc>().add(RemoveProjectsPrize(projects));
                },
                title: projects['projectAwardName'],
                content: projects['certificatesDate'],
              ));
            })
        ],
      );
    });
  }
}
