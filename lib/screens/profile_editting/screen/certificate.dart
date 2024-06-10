// import 'package:date_format_field/date_format_field.dart';
// import 'package:flutter/material.dart';
// import 'package:tobeto_mobile_app/screens/login_screen/login_widgets/custom_button.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
// import 'package:tobeto_mobile_app/utils/constant/colors.dart';
// import 'package:tobeto_mobile_app/utils/constant/text.dart';
// import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

// class CertificateScreen extends StatefulWidget {
//   const CertificateScreen({super.key});

//   @override
//   State<CertificateScreen> createState() => _CertificateScreenState();
// }

// class _CertificateScreenState extends State<CertificateScreen> {
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: ListView(
//         children: [
//           InputText(
//             child: CustomTextField(
//               title: TobetoText.profileEditCertificatesName, onSaved: (String? ) {  }, controller: null,
//             ),
//           ),
//           InputText(
//             child: DateFormatField(
//               decoration: InputDecoration(
//                 focusedBorder: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   borderSide: BorderSide(color: TobetoColor.purple, width: 2.0),
//                 ),
//                 labelText: TobetoText.profileEditCertificatesDate,
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
//             child: CustomTextField(
//               maxLines: 6,
//               title: TobetoText.profileEditCertificatesFile,
//               iconButton: IconButton(
//                   onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
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
