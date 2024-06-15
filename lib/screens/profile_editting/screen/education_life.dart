// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tobeto_mobile_app/blocs/user_bloc/user_bloc.dart';
// import 'package:tobeto_mobile_app/blocs/user_bloc/user_event.dart';
// import 'package:tobeto_mobile_app/blocs/user_bloc/user_state.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_card.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_checkbox.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_dropdown_input.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
// import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
// import 'package:tobeto_mobile_app/services/user_repository.dart';
// import 'package:tobeto_mobile_app/utils/constant/text.dart';
// import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

// class EducationLife extends StatefulWidget {
//   const EducationLife({super.key});

//   @override
//   State<EducationLife> createState() => _EducationLifeState();
// }

// String? selectedEducation;
// bool isChecked = false;

// final TextEditingController educationStatuController = TextEditingController();
// final TextEditingController univercityController = TextEditingController();
// final TextEditingController graduatedDepartmentController =
//     TextEditingController();
// final TextEditingController startUnivercityDateController =
//     TextEditingController();
// final TextEditingController graduateUnivercityDateController =
//     TextEditingController();
// final TextEditingController checkBoxController = TextEditingController();

// class _EducationLifeState extends State<EducationLife> {
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
//       if (state is UserLoading) {
//         return const Center(child: CircularProgressIndicator());
//       } else if (state is UserLoaded) {
//         UserRepository().getData();
//         return Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               InputText(
//                   child: CustomDropDownInput(
//                 onChanged: (newValue) {
//                   educationStatuController.text =
//                       newValue ?? educationStatuController.text;
//                 },
//                 items: TobetoText.educationStatu
//                     .map((label) => DropdownMenuItem(
//                           value: label,
//                           child: Text(label),
//                         ))
//                     .toList(),
//                 title: educationStatuController.text.isNotEmpty
//                     ? educationStatuController.text
//                     : TobetoText.profileEditEducationStatu,
//                 controller: educationStatuController,
//               )),
//               InputText(
//                   child: CustomTextField(
//                 title: TobetoText.profileEditUnivercity,
//                 onSaved: (newValue) {
//                   univercityController.text =
//                       newValue ?? univercityController.text;
//                 },
//                 controller: univercityController,
//               )),
//               InputText(
//                   child: CustomTextField(
//                 title: TobetoText.profileEditGraduatedDepartment,
//                 onSaved: (newValue) {
//                   graduatedDepartmentController.text =
//                       newValue ?? graduatedDepartmentController.text;
//                 },
//                 controller: graduatedDepartmentController,
//               )),
//               InputText(
//                   child: CustomTextField(
//                 title: TobetoText.profileEditStartUnivercityDate,
//                 keyboardType: TextInputType.number,
//                 maxLength: 4,
//                 onSaved: (newValue) {
//                   startUnivercityDateController.text =
//                       newValue ?? startUnivercityDateController.text;
//                 },
//                 controller: startUnivercityDateController,
//               )),
//               InputText(
//                   child: CustomTextField(
//                 title: TobetoText.profileEditGraduateUnivercityDate,
//                 keyboardType: TextInputType.number,
//                 maxLength: 4,
//                 onSaved: (newValue) {
//                   graduateUnivercityDateController.text =
//                       newValue ?? graduateUnivercityDateController.text;
//                 },
//                 controller: graduateUnivercityDateController,
//               )),
//               Row(
//                 children: [
//                   CustomCheckbox(
//                     onChanged: (value) {
//                       setState(() {
//                         isChecked = value!;
//                       });
//                       checkBoxController.text = value.toString();
//                     },
//                     value: isChecked,
//                   ),
//                   Text(
//                     TobetoText.profileEditEducationContinueBox,
//                     style:
//                         TobetoTextStyle.poppins(context).bodyGrayLightNormal16,
//                   ),
//                 ],
//               ),
//               CustomElevatedButton(
//                 text: TobetoText.profileEditSaveButton,
//                 onPressed: () {
//                   _formKey.currentState!.save();
//                   context.read<UserBloc>().add(UpdateUserData());
//                 },
//               ),
//               InputText(
//                 child: CustomCard(
//                   startDate: startUnivercityDateController.text,
//                   endDate: graduateUnivercityDateController.text,
//                   title: 'Üniversite\n',
//                   content: univercityController.text,
//                   title2: '\nBölüm\n',
//                   content2: graduatedDepartmentController.text,
//                 ),
//               )
//             ],
//           ),
//         );
//       } else if (state is UserError) {
//         return Center(child: Text('Error: ${state.message}'));
//       } else {
//         return const Center(child: Text('Bir hata oluştu.'));
//       }
//     });
//   }
// }
