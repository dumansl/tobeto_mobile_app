// import 'package:date_format_field/date_format_field.dart';
// import 'package:flutter/material.dart';
// import 'package:tobeto_mobile_app/screens/login_screen/login_widgets/custom_button.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/screen/profile_edit_screen.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_cardx.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_checkbox.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_dropdown_input.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
// import 'package:tobeto_mobile_app/utils/constant/constants.dart';
// import 'package:tobeto_mobile_app/utils/constant/text.dart';
// import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

// class WorkLife extends StatefulWidget {
//   const WorkLife({super.key});

//   @override
//   State<WorkLife> createState() => _WorkLifeState();
// }

// String? experience = selectedGender;
// bool _isChecked = false;

// class _WorkLifeState extends State<WorkLife> {
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: ListView(
//         children: [
//           InputText(
//             child: CustomTextField(
//               title: TobetoText.profileEditWorkplaceName,
//             ),
//           ),
//           InputText(
//             child: CustomTextField(
//               title: TobetoText.profileEditPosition,
//             ),
//           ),
//           InputText(
//             child: CustomDropDownInput(
//               onChanged: (String? value) {
//                 setState(() {
//                   experience = value;
//                 });
//               },
//               items: ['Staj', 'Gönüllü Çalışma', 'Profesyonel Çalışma']
//                   .map((label) => DropdownMenuItem(
//                         value: label,
//                         child: Text(label),
//                       ))
//                   .toList(),
//               title: TobetoText.profileEditExperienceType,
//             ),
//           ),
//           InputText(
//             child: CustomTextField(title: TobetoText.profileEditSector),
//           ),
//           InputText(
//             child:
//                 CustomTextField(title: TobetoText.profileEditWorkplaceLocation),
//           ),
//           InputText(
//             child: DateFormatField(
//               decoration: InputDecoration(
//                 focusedBorder: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   borderSide: BorderSide(color: TobetoColor.purple, width: 2.0),
//                 ),
//                 labelText: TobetoText.profileEditStartJobDate,
//                 labelStyle: TobetoTextStyle.poppins.bodyGrayLightNormal16,
//                 floatingLabelStyle:
//                     TobetoTextStyle.poppins.captionPurpleNormal18,
//                 border: const OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                   Radius.circular(12),
//                 )),
//                 enabledBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.transparent, width: 1.0),
//                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                 ),
//               ),
//               type: DateFormatType.type2,
//               onComplete: (date) {
//                 print(date.toString);
//               },
//             ),
//           ),
//           InputText(
//             child: DateFormatField(
//               decoration: InputDecoration(
//                 focusedBorder: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   borderSide: BorderSide(color: TobetoColor.purple, width: 2.0),
//                 ),
//                 labelText: TobetoText.profileEditFinishJobDate,
//                 labelStyle: TobetoTextStyle.poppins.bodyGrayLightNormal16,
//                 floatingLabelStyle:
//                     TobetoTextStyle.poppins.captionPurpleNormal18,
//                 border: const OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                   Radius.circular(12),
//                 )),
//                 enabledBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.transparent, width: 1.0),
//                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                 ),
//               ),
//               type: DateFormatType.type2,
//               onComplete: (date) {
//                 print(date.toString);
//               },
//             ),
//           ),
//           Row(
//             children: [
//               CustomCheckbox(
//                 onChanged: (bool? value) {
//                   setState(() {
//                     _isChecked = value!;
//                   });
//                 },
//                 isChecked: _isChecked,
//               ),
//               Text(
//                 TobetoText.profileEditExperienceContinueBox,
//                 style: TobetoTextStyle.poppins.captionBlackSemiBold15,
//               ),
//             ],
//           ),
//           InputText(
//             child: CustomTextField(
//               title: TobetoText.profileEditJobDescription,
//               maxLines: 5,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: CustomButton(
//               text: TobetoText.profileEditSaveButton,
//               onPressed: () {},
//             ),
//           ),
//           InputText(
//             child: CustomCardx(
//               date: '01.07.2024 - 01.07.2024',
//               title: TobetoText.profileEditWorkplaceName,
//               content: 'Akbank',
//               title2: TobetoText.profileEditPosition,
//               content2: 'Flutter Developer',
//               title3: TobetoText.profileEditSector,
//               content3: 'Yazılım',
//               title4: TobetoText.profileEditCity,
//               content4: 'İstanbul',
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
