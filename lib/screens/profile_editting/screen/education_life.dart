import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/education_life_bloc/education_life_bloc.dart';
import 'package:tobeto_mobile_app/blocs/education_life_bloc/education_life_event.dart';
import 'package:tobeto_mobile_app/blocs/education_life_bloc/education_life_state.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_card.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_checkbox.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_date_input.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_dropdown_input.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class EducationLife extends StatefulWidget {
  const EducationLife({super.key});

  @override
  State<EducationLife> createState() => _EducationLifeState();
}

class _EducationLifeState extends State<EducationLife> {
  final TextEditingController educationStatuController = TextEditingController();
  final TextEditingController univercityController = TextEditingController();
  final TextEditingController graduatedDepartmentController = TextEditingController();
  final TextEditingController startUnivercityDateController = TextEditingController();
  final TextEditingController graduateUnivercityDateController = TextEditingController();
  final TextEditingController continueUnivercityController = TextEditingController();
  bool _isChecked = false;

  void _clearControllers() {
    educationStatuController.clear();
    univercityController.clear();
    graduatedDepartmentController.clear();
    startUnivercityDateController.clear();
    graduateUnivercityDateController.clear();
    continueUnivercityController.clear();
  }

  bool _areControllersValid() {
    return educationStatuController.text.isNotEmpty &&
        univercityController.text.isNotEmpty &&
        graduatedDepartmentController.text.isNotEmpty &&
        startUnivercityDateController.text.isNotEmpty &&
        (_isChecked || graduateUnivercityDateController.text.isNotEmpty);
  }

  void _addEducationLife() {
    final educationLife = {
      'educationStatu': educationStatuController.text,
      'univercity': univercityController.text,
      'graduatedDepartment': graduatedDepartmentController.text,
      'startUnivercityDate': startUnivercityDateController.text,
      'graduateUnivercityDate': graduateUnivercityDateController.text,
      'continueUnivercity': _isChecked.toString(),
    };
    context.read<EducationLifeBloc>().add(AddEducationLife(educationLife));
    _clearControllers();
  }

  @override
  void initState() {
    super.initState();
    _isChecked = continueUnivercityController.text.toLowerCase() == 'true';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EducationLifeBloc, EducationLifeState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.error != null) {
        return Center(child: Text('Error: ${state.error}'));
      }
      return ListView(
        children: [
          CustomTitle(title: TobetoText.profileEducations),
          InputText(
              child: CustomDropDownInput(
            onChanged: (newValue) {
              educationStatuController.text = newValue ?? educationStatuController.text;
            },
            items: TobetoText.educationStatu
                .map((label) => DropdownMenuItem(
                      value: label,
                      child: Text(label),
                    ))
                .toList(),
            title: educationStatuController.text.isNotEmpty
                ? educationStatuController.text
                : TobetoText.profileEditEducationStatu,
            controller: educationStatuController,
          )),
          InputText(
              child: CustomTextField(
            title: TobetoText.profileEditUnivercity,
            controller: univercityController,
          )),
          InputText(
              child: CustomTextField(
            title: TobetoText.profileEditGraduatedDepartment,
            controller: graduatedDepartmentController,
          )),
          InputText(
              child: CustomDateInput(
                  controller: startUnivercityDateController, labelText: TobetoText.profileEditStartUnivercityDate)),
          if (!_isChecked) ...[
            InputText(
                child: CustomDateInput(
              controller: graduateUnivercityDateController,
              labelText: TobetoText.profileEditGraduateUnivercityDate,
            ))
          ],
          Row(
            children: [
              CustomCheckbox(
                onChanged: (value) {
                  setState(() {
                    _isChecked = value!;
                    if (_isChecked) {
                      graduateUnivercityDateController.clear();
                    }
                  });
                  continueUnivercityController.text = value.toString();
                },
                value: _isChecked,
                controller: continueUnivercityController,
              ),
              Text(
                TobetoText.profileEditEducationContinueBox,
                style: TobetoTextStyle.poppins(context).bodyGrayLightNormal16,
              ),
            ],
          ),
          CustomElevatedButton(
            onPressed: () {
              if (_areControllersValid()) {
                _addEducationLife();
              } else {
                debugPrint("Form bilgileri eksik veya hatalı");
              }
            },
          ),
          if (state.education.isNotEmpty)
            ...state.education.map((education) {
              return InputText(
                child: CustomCard(
                  startDate: education['startUnivercityDate'],
                  endDate:
                      education['continueUnivercity'] == 'true' ? 'Devam ediyor' : education['graduateUnivercityDate'],
                  title: '${TobetoText.profileEditUnivercity}\n',
                  content: education['univercity'],
                  title2: TobetoText.profileEditGraduatedDepartment,
                  content2: education['graduatedDepartment'],
                  onpressed: () {
                    context.read<EducationLifeBloc>().add(RemoveEducationLife(education));
                  },
                ),
              );
            })
        ],
      );
    });
  }
}
