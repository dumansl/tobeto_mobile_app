// import 'package:flutter/material.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_dropdown_input.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_mini_card.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
// import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
// import 'package:tobeto_mobile_app/utils/constant/text.dart';

// class SocialMedia extends StatefulWidget {
//   const SocialMedia({super.key});

//   @override
//   State<SocialMedia> createState() => _SocialMediaState();
// }

// String? selectedSocialMedia;

// class _SocialMediaState extends State<SocialMedia> {
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
//                         selectedSocialMedia = value;
//                       });
//                     },
//                     items: TobetoText.socialMediaName
//                         .map((label) => DropdownMenuItem(
//                               value: label,
//                               child: Text(label),
//                             ))
//                         .toList(),
//                     title: TobetoText.profileEditSocialMediaName)),
//             InputText(child: CustomTextField(title: TobetoText.profileEditSocialMediaLink)),
//             CustomElevatedButton(
//               text: "Kaydet",
//               onPressed: () {},
//             ),
//             InputText(
//                 child: CustomMiniCard(
//                     imagepath: Image.asset(ImagePath.linkedIn),
//                     onpressed: () {},
//                     title: "www.linkedin.com/in/ensyldzz")),
//             InputText(
//                 child: CustomMiniCard(
//                     imagepath: Image.asset(ImagePath.facebookIcon),
//                     onpressed: () {},
//                     title: "www.facebook.com/in/ensyldzz")),
//           ],
//         ));
//   }
// }
