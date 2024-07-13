import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/projects_prize_bloc/projects_prize_bloc.dart';
import 'package:tobeto_mobile_app/blocs/projects_prize_bloc/projects_prize_event.dart';
import 'package:tobeto_mobile_app/blocs/projects_prize_bloc/projects_prize_state.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_column.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_date_input.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_mini_card.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_title.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/snack_bar.dart';

class ProjectsPrize extends StatefulWidget {
  const ProjectsPrize({super.key});

  @override
  State<ProjectsPrize> createState() => _ProjectsPrizeState();
}

class _ProjectsPrizeState extends State<ProjectsPrize> {
  final TextEditingController projectAwardNameController =
      TextEditingController();
  final TextEditingController certificatesDateController =
      TextEditingController();

  void _clearControllers() {
    projectAwardNameController.clear();
    certificatesDateController.clear();
  }

  bool _areControllersValid() {
    return projectAwardNameController.text.isNotEmpty &&
        certificatesDateController.text.isNotEmpty;
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
    return BlocConsumer<ProjectsPrizeBloc, ProjectsPrizeState>(
        listener: (context, state) {
      if (!state.isLoading && state.error != null) {
        snackBar(context, "İşleminiz başarısız: ${state.error}");
      } else if (!state.isLoading && state.error == null) {
        snackBar(context, "İşleminiz başarılı!",
            bgColor: TobetoColor.state.success);
      }
    }, builder: (context, state) {
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      return ListView(
        children: [
          CustomTitle(title: TobetoText.profileProjectAwards),
          InputText(
            child: CustomTextField(
              title: TobetoText.profileEditProjectAwardName,
              controller: projectAwardNameController,
            ),
          ),
          InputText(
            child: CustomDateInput(
                controller: certificatesDateController,
                labelText: TobetoText.profileEditCertificatesDate),
          ),
          CustomElevatedButton(
            onPressed: () {
              String newProject = projectAwardNameController.text.trim();
              if (_areControllersValid() &&
                  state.projects.length < 5 &&
                  !state.projects.toString().contains(newProject)) {
                _addEducationLife();
              } else if (state.projects.toString().contains(newProject)) {
                snackBar(context, TobetoText.alertProjectAward);
              } else if (state.projects.length >= 5) {
                snackBar(context, TobetoText.maxProjectAward);
              }
            },
          ),
          if (state.projects.isEmpty)
            CustomColumn(title: TobetoText.profileEditProjectAwardSubtitle)
          else
            ...state.projects.map((projects) {
              return InputText(
                  child: CustomMiniCard(
                onpressed: () {
                  context
                      .read<ProjectsPrizeBloc>()
                      .add(RemoveProjectsPrize(projects));
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
