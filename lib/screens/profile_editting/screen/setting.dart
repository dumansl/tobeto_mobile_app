// import 'package:flutter/material.dart';
// import 'package:tobeto_mobile_app/screens/login_screen/login_widgets/custom_button.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
// import 'package:tobeto_mobile_app/utils/constant/text.dart';

// class Setting extends StatefulWidget {
//   const Setting({super.key});

//   @override
//   State<Setting> createState() => _SettingState();
// }

// class _SettingState extends State<Setting> {
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: ListView(
//         children: [
//           InputText(
//             child: CustomTextField(
//               title: TobetoText.profileEditSettingsOldPassword,
//             ),
//           ),
//           InputText(
//             child: CustomTextField(
//               title: TobetoText.profileEditSettingsNewPassword,
//             ),
//           ),
//           InputText(
//             child: CustomTextField(
//               title: TobetoText.profileEditSettingsOldPasswordAgain,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: CustomButton(
//               text: TobetoText.profileEditSaveButton,
//               onPressed: () {},
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: CustomButton(
//               text: TobetoText.profileEditSaveButton,
//               onPressed: () {},
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
