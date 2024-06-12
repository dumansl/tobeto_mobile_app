// import 'package:flutter/material.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_dropdown_input.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_mini_card.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
// import 'package:tobeto_mobile_app/utils/constant/constants.dart';

// class Languages extends StatefulWidget {
//   const Languages({super.key});

//   @override
//   State<Languages> createState() => _LanguagesState();
// }

// String? selectedLanguageLevel;
// String? selectedLanguages;

// class _LanguagesState extends State<Languages> {
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
//                         selectedLanguages = value;
//                       });
//                     },
//                     items: TobetoText.languageList
//                         .map((label) => DropdownMenuItem(
//                               value: label,
//                               child: Text(label),
//                             ))
//                         .toList(),
//                     title: TobetoText.profileEditLanguageName)),
//             InputText(
//                 child: CustomDropDownInput(
//                     onChanged: (String? value) {
//                       setState(() {
//                         selectedLanguageLevel = value;
//                       });
//                     },
//                     items: TobetoText.languageLevel
//                         .map((label) => DropdownMenuItem(
//                               value: label,
//                               child: Text(label),
//                             ))
//                         .toList(),
//                     title: TobetoText.profileEditLanguageLevel)),
//             CustomElevatedButton(
//               text: "Kaydet",
//               onPressed: () {},
//             ),
//             InputText(
//                 child: CustomMiniCard(
//               imagepath: Image.asset(ImagePath.foreignLanguages),
//               onpressed: () {},
//               title: 'Türkçe',
//               content: " (Anadil)",
//             ))
//           ],
//         ));
//   }
// }
