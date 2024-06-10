// import 'package:flutter/material.dart';
// import 'package:tobeto_mobile_app/screens/login_screen/login_widgets/custom_button.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
// import 'package:tobeto_mobile_app/utils/constant/constants.dart';
// import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

// class ClupCominities extends StatefulWidget {
//   const ClupCominities({super.key});

//   @override
//   State<ClupCominities> createState() => _ClupCominitiesState();
// }

// class _ClupCominitiesState extends State<ClupCominities> {
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: ListView(
//         children: [
//           InputText(
//             child: CustomTextField(title: TobetoText.profileEditCommunityName),
//           ),
//           InputText(
//             child: CustomTextField(title: TobetoText.profileEditCommunityTitle),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: CustomButton(
//               text: TobetoText.profileEditSaveButton,
//               onPressed: () {},
//             ),
//           ),
//           InputText(
//               child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(ImagePath.profileEditNote),
//               Center(
//                 child: Text(
//                   TobetoText.profileEditCommunitySubtitle,
//                   style: TobetoTextStyle.poppins.bodyGrayMediumSemiBold16,
//                 ),
//               )
//             ],
//           ))
//         ],
//       ),
//     );
//   }
// }
