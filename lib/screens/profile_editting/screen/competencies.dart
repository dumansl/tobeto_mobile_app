// import 'package:flutter/material.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_mini_card.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
// import 'package:tobeto_mobile_app/utils/constant/constants.dart';

// class Competencies extends StatefulWidget {
//   const Competencies({super.key});

//   @override
//   State<Competencies> createState() => _CompetenciesState();
// }

// class _CompetenciesState extends State<Competencies> {
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         key: _formKey,
//         child: ListView(
//           children: [
//             InputText(child: CustomTextField(title: TobetoText.profileEditSkill)),
//             CustomElevatedButton(
//               text: "Ekle",
//               onPressed: () {},
//             ),
//             InputText(child: CustomMiniCard(onpressed: () {}, title: 'Aktif Öğrenme')),
//             InputText(child: CustomMiniCard(onpressed: () {}, title: 'Algoritma')),
//             InputText(child: CustomMiniCard(onpressed: () {}, title: 'Yönetim')),
//             InputText(child: CustomMiniCard(onpressed: () {}, title: 'Takım Çalışması')),
//             InputText(child: CustomMiniCard(onpressed: () {}, title: 'Kodlama')),
//           ],
//         ));
//   }
// }
