import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format_field/date_format_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/repositories/user_repository.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_dropdown_input.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/phone_textfield.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _GeneralTabState();
}

late TextEditingController firstNameController;
late TextEditingController lastNameController;
late TextEditingController identificationController;
late TextEditingController emailController;
late TextEditingController githubController;
late TextEditingController countryController;
late TextEditingController cityController;
late TextEditingController districtController;
late TextEditingController streetController;
late TextEditingController aboutMeController;

class _GeneralTabState extends State<PersonalInformation> {
  String? selectedGender;
  String? selectedMilitaryStatus;
  String? selectedDisabilityStatus;

  @override
  void initState() {
    super.initState();
    UserRepository().initializeControllers();
    loadData();
  }

  Future<void> loadData() async {
    await UserRepository().getData();
    setState(() {});
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(ImagePath.profilePhoto),
          ),
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
          const InputText(child: PhoneTextField()),
          InputText(
              child: DateFormatField(
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: TobetoColor.purple, width: 2.0),
                    ),
                    labelText: TobetoText.profileEditBirthday,
                    labelStyle: TobetoTextStyle.poppins.bodyGrayLightNormal16,
                    floatingLabelStyle: TobetoTextStyle.poppins.captionPurpleNormal18,
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
                    print(date.toString);
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
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  items: TobetoText.genderStatu
                      .map((label) => DropdownMenuItem(
                            value: label,
                            child: Text(label),
                          ))
                      .toList(),
                  title: TobetoText.profileEditGender)),
          InputText(
              child: CustomDropDownInput(
                  onChanged: (value) {
                    setState(() {
                      selectedMilitaryStatus = value;
                    });
                  },
                  items: TobetoText.militaryStatu
                      .map((label) => DropdownMenuItem(
                            value: label,
                            child: Text(label),
                          ))
                      .toList(),
                  title: TobetoText.profileEditMilitaryStuation)),
          InputText(
              child: CustomDropDownInput(
                  onChanged: (value) {
                    setState(() {
                      selectedDisabilityStatus = value;
                    });
                  },
                  items: TobetoText.disableStatu
                      .map((label) => DropdownMenuItem(
                            value: label,
                            child: Text(label),
                          ))
                      .toList(),
                  title: TobetoText.profileEditDisableStuation)),
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
              UserRepository().uploadProfileEdit();
            },
          ),
        ],
      ),
    );
  }
}
