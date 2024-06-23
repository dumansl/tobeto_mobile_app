import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_event.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_state.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_date_input.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_dropdown_input.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/phone_textfield.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserLoaded) {
          return ListView(
            children: [
              CustomTitle(title: TobetoText.personalInformationTitle),
              InputText(
                  child: CustomTextField(
                title: TobetoText.profileEditName,
                controller: firstNameController,
              )),
              InputText(
                  child: CustomTextField(
                title: TobetoText.profileEditSurname,
                controller: lastNameController,
              )),
              InputText(
                  child: PhoneTextField(
                controller: phoneNumberController,
              )),
              InputText(
                  child: CustomDateInput(controller: birthDateController, labelText: TobetoText.profileEditBirthday)),
              InputText(
                  child: CustomTextField(
                title: TobetoText.profileEditIdentificationNumber,
                keyboardType: TextInputType.number,
                maxLength: 11,
                controller: identificationController,
              )),
              InputText(
                  child: CustomTextField(
                title: TobetoText.profileEditEmail,
                keyboardType: TextInputType.emailAddress,
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
                  labelText: TobetoText.profileEditGender,
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
                labelText: TobetoText.profileEditMilitaryStuation,
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
                labelText: TobetoText.profileEditDisableStuation,
              )),
              InputText(
                  child: CustomTextField(
                title: TobetoText.profileEditGithubAdress,
                controller: githubController,
              )),
              InputText(
                  child: CustomTextField(
                title: TobetoText.profileEditCountry,
                controller: countryController,
              )),
              InputText(
                  child: CustomTextField(
                title: TobetoText.profileEditCity,
                controller: cityController,
              )),
              InputText(
                  child: CustomTextField(
                title: TobetoText.profileEditDistrict,
                controller: districtController,
              )),
              InputText(
                  child: CustomTextField(
                title: TobetoText.profileEditStreet,
                maxLines: 4,
                controller: streetController,
              )),
              InputText(
                  child: CustomTextField(
                title: TobetoText.profileEditAboutMe,
                maxLines: 4,
                controller: aboutMeController,
              )),
              CustomElevatedButton(
                text: TobetoText.profileEditSaveButton,
                onPressed: () {
                  context.read<UserBloc>().add(UpdateUserData());
                },
              ),
            ],
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
