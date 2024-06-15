import 'package:date_format_field/date_format_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_event.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_state.dart';
import 'package:tobeto_mobile_app/screens/login_screen/login_widgets/custom_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_card.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_checkbox.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_dropdown_input.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/services/user_repository.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class WorkLife extends StatefulWidget {
  const WorkLife({super.key});

  @override
  State<WorkLife> createState() => _WorkLifeState();
}

final TextEditingController workplaceNameController = TextEditingController();
final TextEditingController positionController = TextEditingController();
final TextEditingController experienceTypeController = TextEditingController();
final TextEditingController sectorController = TextEditingController();
final TextEditingController workplaceLocationController = TextEditingController();
final TextEditingController worklifeStartController = TextEditingController();
final TextEditingController worklifeEndController = TextEditingController();
final TextEditingController jobDescriptionController = TextEditingController();
final TextEditingController workStatuController = TextEditingController();

bool _isChecked = bool.parse(workStatuController.text);

class _WorkLifeState extends State<WorkLife> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is UserLoaded) {
        return Form(
          key: _formKey,
          child: ListView(
            children: [
              InputText(
                child: CustomTextField(
                  title: TobetoText.profileEditWorkplaceName,
                  onSaved: (newValue) {
                    workplaceNameController.text = newValue ?? workplaceNameController.text;
                  },
                  controller: workplaceNameController,
                ),
              ),
              InputText(
                child: CustomTextField(
                  title: TobetoText.profileEditPosition,
                  onSaved: (newValue) {
                    positionController.text = newValue ?? positionController.text;
                  },
                  controller: positionController,
                ),
              ),
              InputText(
                child: CustomDropDownInput(
                  onChanged: (newValue) {
                    experienceTypeController.text = newValue ?? experienceTypeController.text;
                  },
                  items: TobetoText.militaryStatu
                      .map((label) => DropdownMenuItem(
                            value: label,
                            child: Text(label),
                          ))
                      .toList(),
                  title: experienceTypeController.text.isNotEmpty
                      ? experienceTypeController.text
                      : TobetoText.profileEditGender,
                  controller: experienceTypeController,
                ),
              ),
              InputText(
                child: CustomTextField(
                  title: TobetoText.profileEditSector,
                  onSaved: (newValue) {
                    sectorController.text = newValue ?? sectorController.text;
                  },
                  controller: sectorController,
                ),
              ),
              InputText(
                child: CustomTextField(
                  title: TobetoText.profileEditWorkplaceLocation,
                  onSaved: (newValue) {
                    workplaceLocationController.text = newValue ?? workplaceLocationController.text;
                  },
                  controller: workplaceLocationController,
                ),
              ),
              InputText(
                child: DateFormatField(
                  controller: worklifeStartController,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: TobetoColor.purple, width: 2.0),
                    ),
                    labelText: TobetoText.profileEditStartJobDate,
                    labelStyle: TobetoTextStyle.poppins(context).bodyGrayLightNormal16,
                    floatingLabelStyle: TobetoTextStyle.poppins(context).captionPurpleNormal18,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    )),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  type: DateFormatType.type2,
                  onComplete: (date) {
                    debugPrint("$date");
                  },
                ),
              ),
              if (!_isChecked) ...[
                InputText(
                  child: DateFormatField(
                    controller: worklifeEndController,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: TobetoColor.purple, width: 2.0),
                      ),
                      labelText: TobetoText.profileEditFinishJobDate,
                      labelStyle: TobetoTextStyle.poppins(context).bodyGrayLightNormal16,
                      floatingLabelStyle: TobetoTextStyle.poppins(context).captionPurpleNormal18,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      )),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    type: DateFormatType.type2,
                    onComplete: (date) {
                      debugPrint("$date");
                    },
                  ),
                ),
              ],
              Row(
                children: [
                  CustomCheckbox(
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                        _isChecked ? worklifeEndController.clear() : null;
                      });
                      workStatuController.text = value.toString();
                    },
                    value: bool.parse(workStatuController.text),
                    controller: workStatuController,
                  ),
                  Text(
                    TobetoText.profileEditExperienceContinueBox,
                    style: TobetoTextStyle.poppins(context).captionBlackSemiBold15,
                  ),
                ],
              ),
              InputText(
                child: CustomTextField(
                  title: TobetoText.profileEditJobDescription,
                  maxLines: 5,
                  onSaved: (newValue) {
                    jobDescriptionController.text = newValue ?? jobDescriptionController.text;
                  },
                  controller: jobDescriptionController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomButton(
                  text: TobetoText.profileEditSaveButton,
                  onPressed: () {
                    _formKey.currentState!.save();
                    context.read<UserBloc>().add(UpdateUserData());
                  },
                ),
              ),
              InputText(
                child: CustomCard(
                  startDate: worklifeStartController.text,
                  endDate: workStatuController.text == 'true' ? 'Devam ediyor' : worklifeEndController.text,
                  title: 'Kurum adı\n',
                  content: workplaceNameController.text,
                  title2: '\nPozisyon\n',
                  content2: positionController.text,
                  title3: '\nSektör\n',
                  content3: sectorController.text,
                  title4: '\nŞehir\n',
                  content4: workplaceLocationController.text,
                ),
              ),
            ],
          ),
        );
      } else if (state is UserError) {
        return Center(child: Text('Error: ${state.message}'));
      } else {
        return const Center(child: Text('Bir hata oluştu.'));
      }
    });
  }
}
