import 'package:date_format_field/date_format_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_event.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_state.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_dropdown_input.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/phone_textfield.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class PersonalInformationForm extends StatefulWidget {
  const PersonalInformationForm({super.key});

  @override
  State<PersonalInformationForm> createState() => _PersonalInformationFormState();
}

final TextEditingController firstNameController = TextEditingController();
final TextEditingController lastNameController = TextEditingController();
final TextEditingController phoneNumberController = TextEditingController();
final TextEditingController birthDateController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController identificationController = TextEditingController();
final TextEditingController githubController = TextEditingController();
final TextEditingController countryController = TextEditingController();
final TextEditingController cityController = TextEditingController();
final TextEditingController districtController = TextEditingController();
final TextEditingController streetController = TextEditingController();
final TextEditingController aboutMeController = TextEditingController();
final TextEditingController genderController = TextEditingController();
final TextEditingController militaryStatuController = TextEditingController();
final TextEditingController disabledStatuController = TextEditingController();

class _PersonalInformationFormState extends State<PersonalInformationForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserLoaded) {
          return Form(
            key: _formKey,
            child: ListView(
              children: [
                InputText(
                    child: CustomTextField(
                  title: TobetoText.profileEditName,
                  onSaved: (newValue) {
                    firstNameController.text = newValue ?? firstNameController.text;
                  },
                  controller: firstNameController,
                )),
                InputText(
                    child: CustomTextField(
                  title: TobetoText.profileEditSurname,
                  onSaved: (newValue) {
                    lastNameController.text = newValue ?? lastNameController.text;
                  },
                  controller: lastNameController,
                )),
                InputText(
                    child: PhoneTextField(
                  controller: phoneNumberController,
                  onSaved: (newValue) {
                    phoneNumberController.text = newValue!.number.toString();
                  },
                )),
                InputText(
                    child: DateFormatField(
                        controller: birthDateController,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: TobetoColor.purple, width: 2.0),
                          ),
                          labelText: TobetoText.profileEditBirthday,
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
                        })),
                InputText(
                    child: CustomTextField(
                  title: TobetoText.profileEditIdentificationNumber,
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  onSaved: (newValue) {
                    identificationController.text = newValue ?? identificationController.text;
                  },
                  controller: identificationController,
                )),
                InputText(
                    child: CustomTextField(
                  title: TobetoText.profileEditEmail,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (newValue) {
                    emailController.text = newValue ?? emailController.text;
                  },
                  controller: emailController,
                )),
                InputText(
                  child: CustomDropDownInput(
                    onChanged: (newValue) {
                      genderController.text = newValue ?? genderController.text;
                    },
                    items: TobetoText.genderStatu
                        .map((label) => DropdownMenuItem(
                              value: label,
                              child: Text(label),
                            ))
                        .toList(),
                    title: genderController.text.isNotEmpty ? genderController.text : TobetoText.profileEditGender,
                    controller: genderController,
                  ),
                ),
                InputText(
                    child: CustomDropDownInput(
                  onChanged: (newValue) {
                    militaryStatuController.text = newValue ?? militaryStatuController.text;
                  },
                  items: TobetoText.militaryStatu
                      .map((label) => DropdownMenuItem(
                            value: label,
                            child: Text(label),
                          ))
                      .toList(),
                  title: militaryStatuController.text.isNotEmpty
                      ? militaryStatuController.text
                      : TobetoText.profileEditMilitaryStuation,
                  controller: militaryStatuController,
                )),
                InputText(
                    child: CustomDropDownInput(
                  onChanged: (newValue) {
                    disabledStatuController.text = newValue ?? disabledStatuController.text;
                  },
                  items: TobetoText.disableStatu
                      .map((label) => DropdownMenuItem(
                            value: label,
                            child: Text(label),
                          ))
                      .toList(),
                  title: disabledStatuController.text.isNotEmpty
                      ? disabledStatuController.text
                      : TobetoText.profileEditDisableStuation,
                  controller: disabledStatuController,
                )),
                InputText(
                    child: CustomTextField(
                  title: TobetoText.profileEditGithubAdress,
                  onSaved: (newValue) {
                    githubController.text = newValue ?? githubController.text;
                  },
                  controller: githubController,
                )),
                InputText(
                    child: CustomTextField(
                  title: TobetoText.profileEditCountry,
                  onSaved: (newValue) {
                    countryController.text = newValue ?? countryController.text;
                  },
                  controller: countryController,
                )),
                InputText(
                    child: CustomTextField(
                  title: TobetoText.profileEditCity,
                  onSaved: (newValue) {
                    cityController.text = newValue ?? cityController.text;
                  },
                  controller: cityController,
                )),
                InputText(
                    child: CustomTextField(
                  title: TobetoText.profileEditDistrict,
                  onSaved: (newValue) {
                    districtController.text = newValue ?? districtController.text;
                  },
                  controller: districtController,
                )),
                InputText(
                    child: CustomTextField(
                  title: TobetoText.profileEditStreet,
                  maxLines: 4,
                  onSaved: (newValue) {
                    streetController.text = newValue ?? streetController.text;
                  },
                  controller: streetController,
                )),
                InputText(
                    child: CustomTextField(
                  title: TobetoText.profileEditAboutMe,
                  maxLines: 4,
                  onSaved: (newValue) {
                    aboutMeController.text = newValue ?? aboutMeController.text;
                  },
                  controller: aboutMeController,
                )),
                CustomElevatedButton(
                  text: TobetoText.profileEditSaveButton,
                  onPressed: () {
                    _formKey.currentState!.save();
                    context.read<UserBloc>().add(UpdateUserData());
                  },
                ),
              ],
            ),
          );
        } else if (state is UserError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('Bir hata oluştu.'));
        }
      },
    );
  }
}
