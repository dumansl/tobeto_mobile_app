import 'package:date_format_field/date_format_field.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/login_screen/login_widgets/custom_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_dropdown_input.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/phone_textfield.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class GeneralTab extends StatefulWidget {
  const GeneralTab({super.key});

  @override
  State<GeneralTab> createState() => _GeneralTabState();
}

String? selectedGender = selectedGender;
String? selectedMilitaryStatus = selectedMilitaryStatus;
String? selectedDisabilityStatus = selectedDisabilityStatus;

class _GeneralTabState extends State<GeneralTab> {
  final _formKey = GlobalKey<FormState>();
  late ImagePath imagepath;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(ImagePath.profilePhoto),
          ),
          InputText(child: CustomTextField(title: TobetoText.profileEditName)),
          InputText(child: CustomTextField(title: TobetoText.profileEditSurname)),
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
          )),
          InputText(
              child: CustomTextField(
            title: TobetoText.profileEditEmail,
            keyboardType: TextInputType.emailAddress,
          )),
          InputText(
              child: CustomDropDownInput(
                  onChanged: (String? value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  items: ['Erkek', 'Kadın']
                      .map((label) => DropdownMenuItem(
                            value: label,
                            child: Text(label),
                          ))
                      .toList(),
                  title: TobetoText.profileEditGender)),
          InputText(
              child: CustomDropDownInput(
                  onChanged: (String? value) {
                    setState(() {
                      selectedMilitaryStatus = value;
                    });
                  },
                  items: ['Yapıldı', 'Yapılmadı', 'Muaf']
                      .map((label) => DropdownMenuItem(
                            value: label,
                            child: Text(label),
                          ))
                      .toList(),
                  title: TobetoText.profileEditMilitaryStuation)),
          InputText(
              child: CustomDropDownInput(
                  onChanged: (String? value) {
                    setState(() {
                      selectedDisabilityStatus = value;
                    });
                  },
                  items: ['Yok', 'Var']
                      .map((label) => DropdownMenuItem(
                            value: label,
                            child: Text(label),
                          ))
                      .toList(),
                  title: TobetoText.profileEditDisableStuation)),
          InputText(child: CustomTextField(title: TobetoText.profileEditGithubAdress)),
          InputText(child: CustomTextField(title: TobetoText.profileEditCountry)),
          InputText(child: CustomTextField(title: TobetoText.profileEditCity)),
          InputText(child: CustomTextField(title: TobetoText.profileEditDistrict)),
          InputText(
              child: CustomTextField(
            title: TobetoText.profileEditStreet,
            maxLines: 4,
          )),
          InputText(
              child: CustomTextField(
            title: TobetoText.profileEditAboutMe,
            maxLines: 4,
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CustomButton(
              text: TobetoText.profileEditSaveButton,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
