// import 'package:flutter/material.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_card.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_checkbox.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_dropdown_input.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
// import 'package:tobeto_mobile_app/utils/constant/text.dart';
// import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

// class EducationLife extends StatefulWidget {
//   const EducationLife({super.key});

//   @override
//   State<EducationLife> createState() => _EducationLifeState();
// }

// String? selectedEducation;
// bool isChecked = false;

// class _EducationLifeState extends State<EducationLife> {
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         key: _formKey,
//         child: ListView(
//           children: [
//             InputText(
//                 child: CustomDropDownInput(
//                     onChanged: (String? value) {
//                       setState(() {
//                         selectedEducation = value;
//                       });
//                     },
//                     items: TobetoText.educationStatu
//                         .map((label) => DropdownMenuItem(
//                               value: label,
//                               child: Text(label),
//                             ))
//                         .toList(),
//                     title: TobetoText.profileEditEducationStatu)),
//             InputText(child: CustomTextField(title: TobetoText.profileEditUnivercity)),
//             InputText(child: CustomTextField(title: TobetoText.profileEditGraduatedDepartment)),
//             InputText(
//                 child: CustomTextField(
//               title: TobetoText.profileEditStartUnivercityDate,
//               keyboardType: TextInputType.number,
//               maxLength: 4,
//             )),
//             InputText(
//                 child: CustomTextField(
//               title: TobetoText.profileEditGraduateUnivercityDate,
//               keyboardType: TextInputType.number,
//               maxLength: 4,
//             )),
//             Row(
//               children: [
//                 CustomCheckbox(
//                   onChanged: (bool? value) {
//                     setState(() {
//                       isChecked = value!;
//                     });
//                   },
//                   isChecked: isChecked,
//                 ),
//                 Text(
//                   TobetoText.profileEditEducationContinueBox,
//                   style: TobetoTextStyle.poppins.bodyGrayLightNormal16,
//                 ),
//               ],
//             ),
//             CustomElevatedButton(
//               text: TobetoText.profileEditSaveButton,
//               onPressed: () {},
//             ),
//             const InputText(
//               child: CustomCard(
//                 date: '2016-2020',
//                 title: 'Üniversite',
//                 content: '\nNecmettin Erbakan Üniversitesi',
//                 title2: '\nBölüm',
//                 content2: '\nŞehir ve Bölge Planlama',
//               ),
//             )
//           ],
//         ));
//   }
// }
