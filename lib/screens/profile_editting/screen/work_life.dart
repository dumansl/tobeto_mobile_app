import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/work_life_bloc/work_life_bloc.dart';
import 'package:tobeto_mobile_app/blocs/work_life_bloc/work_life_event.dart';
import 'package:tobeto_mobile_app/blocs/work_life_bloc/work_life_state.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_card.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_checkbox.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_date_input.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_dropdown_input.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_title.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/snack_bar.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class WorkLife extends StatefulWidget {
  const WorkLife({super.key});

  @override
  State<WorkLife> createState() => _WorkLifeState();
}

class _WorkLifeState extends State<WorkLife> {
  final TextEditingController workplaceNameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController experienceTypeController =
      TextEditingController();
  final TextEditingController sectorController = TextEditingController();
  final TextEditingController workplaceLocationController =
      TextEditingController();
  final TextEditingController worklifeStartController = TextEditingController();
  final TextEditingController worklifeEndController = TextEditingController();
  final TextEditingController jobDescriptionController =
      TextEditingController();
  final TextEditingController workStatuController = TextEditingController();
  bool isChecked = false;

  void clearControllers() {
    workplaceNameController.clear();
    positionController.clear();
    experienceTypeController.clear();
    sectorController.clear();
    workplaceLocationController.clear();
    worklifeStartController.clear();
    worklifeEndController.clear();
    jobDescriptionController.clear();
    workStatuController.clear();
  }

  bool _areControllersValid() {
    return workplaceNameController.text.isNotEmpty &&
        positionController.text.isNotEmpty &&
        experienceTypeController.text.isNotEmpty &&
        sectorController.text.isNotEmpty &&
        workplaceLocationController.text.isNotEmpty &&
        worklifeStartController.text.isNotEmpty &&
        (isChecked || worklifeEndController.text.isNotEmpty) &&
        jobDescriptionController.text.isNotEmpty;
  }

  void _addWorkLife() {
    final workLife = {
      'workplaceName': workplaceNameController.text,
      'position': positionController.text,
      'experienceType': experienceTypeController.text,
      'sector': sectorController.text,
      'workplaceLocation': workplaceLocationController.text,
      'worklifeStart': worklifeStartController.text,
      'worklifeEnd': isChecked ? '' : worklifeEndController.text,
      'jobDescription': jobDescriptionController.text,
      'workStatu': isChecked.toString(),
    };
    context.read<WorkLifeBloc>().add(AddWorkLife(workLife));
    clearControllers();
  }

  @override
  void initState() {
    super.initState();
    isChecked = workStatuController.text.toLowerCase() == 'true';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkLifeBloc, WorkLifeState>(
      listener: (context, state) {
        if (state.error != null) {
          snackBar(context, "İşleminiz başarısız: ${state.error}");
        } else if (!state.isLoading && state.error == null) {
          snackBar(context, "İşleminiz başarılı!",
              bgColor: TobetoColor.state.success);
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
            CustomTitle(title: TobetoText.workLifeTitle),
            InputText(
              child: CustomTextField(
                title: TobetoText.profileEditWorkplaceName,
                controller: workplaceNameController,
              ),
            ),
            InputText(
              child: CustomTextField(
                title: TobetoText.profileEditPosition,
                controller: positionController,
              ),
            ),
            InputText(
              child: CustomDropDownInput(
                onChanged: (newValue) {
                  experienceTypeController.text =
                      newValue ?? experienceTypeController.text;
                },
                items: TobetoText.profileEditExperienceTypeList
                    .map((label) => DropdownMenuItem(
                          value: label,
                          child: Text(label),
                        ))
                    .toList(),
                title: experienceTypeController.text.isNotEmpty
                    ? experienceTypeController.text
                    : TobetoText.profileEditExperienceType,
                controller: experienceTypeController,
              ),
            ),
            InputText(
              child: CustomTextField(
                title: TobetoText.profileEditSector,
                controller: sectorController,
              ),
            ),
            InputText(
              child: CustomTextField(
                title: TobetoText.profileEditWorkplaceLocation,
                controller: workplaceLocationController,
              ),
            ),
            InputText(
              child: CustomDateInput(
                controller: worklifeStartController,
                labelText: TobetoText.profileEditStartJobDate,
              ),
            ),
            if (!isChecked) ...[
              InputText(
                child: CustomDateInput(
                  controller: worklifeEndController,
                  labelText: TobetoText.profileEditFinishJobDate,
                ),
              ),
            ],
            Row(
              children: [
                CustomCheckbox(
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                      if (isChecked) {
                        worklifeEndController.clear();
                      }
                      workStatuController.text = isChecked.toString();
                    });
                  },
                  value: isChecked,
                  controller: workStatuController,
                ),
                Text(
                  TobetoText.profileEditExperienceContinueBox,
                  style:
                      TobetoTextStyle.poppins(context).captionBlackSemiBold15,
                ),
              ],
            ),
            InputText(
              child: CustomTextField(
                title: TobetoText.profileEditJobDescription,
                maxLines: 5,
                controller: jobDescriptionController,
              ),
            ),
            CustomElevatedButton(
              onPressed: () {
                if (_areControllersValid()) {
                  _addWorkLife();
                }
              },
            ),
            if (state.works.isNotEmpty)
              ...state.works.map((work) {
                return InputText(
                  child: CustomCard(
                    startDate: work['worklifeStart'],
                    endDate: work['workStatu'] == 'true'
                        ? 'Devam ediyor'
                        : work['worklifeEnd'],
                    title: TobetoText.profileEditWorkplaceName,
                    content: work['workplaceName'],
                    title2: TobetoText.profileEditPosition,
                    content2: work['position'],
                    title3: TobetoText.profileEditSector,
                    content3: work['sector'],
                    title4: TobetoText.profileEditCity,
                    content4: work['workplaceLocation'],
                    onpressed: () {
                      context.read<WorkLifeBloc>().add(RemoveWorkLife(work));
                    },
                  ),
                );
              }),
          ],
        );
      },
    );
  }
}
