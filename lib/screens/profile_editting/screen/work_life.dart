import 'package:date_format_field/date_format_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/work_life_bloc/work_life_bloc.dart';
import 'package:tobeto_mobile_app/blocs/work_life_bloc/work_life_event.dart';
import 'package:tobeto_mobile_app/blocs/work_life_bloc/work_life_state.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_card.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_checkbox.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_dropdown_input.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class WorkLife extends StatefulWidget {
  const WorkLife({super.key});

  @override
  State<WorkLife> createState() => _WorkLifeState();
}

final TextEditingController workplaceNameController = TextEditingController();
final TextEditingController positionController = TextEditingController();
final TextEditingController experienceTypeController = TextEditingController();
final TextEditingController sectorController = TextEditingController();
final TextEditingController workplaceLocationController = TextEditingController();
final TextEditingController worklifeStartController = TextEditingController();
final TextEditingController worklifeEndController = TextEditingController();
final TextEditingController jobDescriptionController = TextEditingController();
final TextEditingController workStatuController = TextEditingController();
bool isChecked = false;

class _WorkLifeState extends State<WorkLife> {
  void clearControllers() {
    workplaceNameController.clear();
    positionController.clear();
    experienceTypeController.clear();
    sectorController.clear();
    workplaceLocationController.clear();
    worklifeStartController.clear();
    worklifeEndController.clear();
    jobDescriptionController.clear();
    workStatuController.clear();
  }

  bool _areControllersValid() {
    return workplaceNameController.text.isNotEmpty &&
        positionController.text.isNotEmpty &&
        experienceTypeController.text.isNotEmpty &&
        sectorController.text.isNotEmpty &&
        workplaceLocationController.text.isNotEmpty &&
        worklifeStartController.text.isNotEmpty &&
        (isChecked || worklifeEndController.text.isNotEmpty) &&
        jobDescriptionController.text.isNotEmpty;
  }

  void _addWorkLife() {
    final workLife = {
      'workplaceName': workplaceNameController.text,
      'position': positionController.text,
      'experienceType': experienceTypeController.text,
      'sector': sectorController.text,
      'workplaceLocation': workplaceLocationController.text,
      'worklifeStart': worklifeStartController.text,
      'worklifeEnd': isChecked ? '' : worklifeEndController.text,
      'jobDescription': jobDescriptionController.text,
      'workStatu': isChecked.toString(),
    };
    context.read<WorkLifeBloc>().add(AddWorkLife(workLife));
    clearControllers();
  }

  @override
  void initState() {
    super.initState();
    isChecked = workStatuController.text.toLowerCase() == 'true';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkLifeBloc, WorkLifeState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.error != null) {
        return Center(child: Text('Error: ${state.error}'));
      }
      return ListView(
        children: [
          InputText(
            child: CustomTextField(
              title: TobetoText.profileEditWorkplaceName,
              onSaved: (newValue) {
                workplaceNameController.text = newValue ?? workplaceNameController.text;
              },
              controller: workplaceNameController,
            ),
          ),
          InputText(
            child: CustomTextField(
              title: TobetoText.profileEditPosition,
              onSaved: (newValue) {
                positionController.text = newValue ?? positionController.text;
              },
              controller: positionController,
            ),
          ),
          InputText(
            child: CustomDropDownInput(
              onChanged: (newValue) {
                experienceTypeController.text = newValue ?? experienceTypeController.text;
              },
              items: TobetoText.profileEditExperienceTypeList
                  .map((label) => DropdownMenuItem(
                        value: label,
                        child: Text(label),
                      ))
                  .toList(),
              title: experienceTypeController.text.isNotEmpty
                  ? experienceTypeController.text
                  : TobetoText.profileEditExperienceType,
              controller: experienceTypeController,
            ),
          ),
          InputText(
            child: CustomTextField(
              title: TobetoText.profileEditSector,
              onSaved: (newValue) {
                sectorController.text = newValue ?? sectorController.text;
              },
              controller: sectorController,
            ),
          ),
          InputText(
            child: CustomTextField(
              title: TobetoText.profileEditWorkplaceLocation,
              onSaved: (newValue) {
                workplaceLocationController.text = newValue ?? workplaceLocationController.text;
              },
              controller: workplaceLocationController,
            ),
          ),
          InputText(
            child: DateFormatField(
              controller: worklifeStartController,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: TobetoColor.purple, width: 2.0),
                ),
                labelText: TobetoText.profileEditStartJobDate,
                labelStyle: TobetoTextStyle.poppins(context).bodyGrayLightNormal16,
                floatingLabelStyle: TobetoTextStyle.poppins(context).captionPurpleNormal18,
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
                debugPrint("$date");
              },
            ),
          ),
          if (!isChecked) ...[
            InputText(
              child: DateFormatField(
                controller: worklifeEndController,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: TobetoColor.purple, width: 2.0),
                  ),
                  labelText: TobetoText.profileEditFinishJobDate,
                  labelStyle: TobetoTextStyle.poppins(context).bodyGrayLightNormal16,
                  floatingLabelStyle: TobetoTextStyle.poppins(context).captionPurpleNormal18,
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
                  debugPrint("$date");
                },
              ),
            ),
          ],
          Row(
            children: [
              CustomCheckbox(
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                    if (isChecked) {
                      worklifeEndController.clear();
                    }
                    workStatuController.text = isChecked.toString();
                  });
                },
                value: isChecked,
                controller: workStatuController,
              ),
              Text(
                TobetoText.profileEditExperienceContinueBox,
                style: TobetoTextStyle.poppins(context).captionBlackSemiBold15,
              ),
            ],
          ),
          InputText(
            child: CustomTextField(
              title: TobetoText.profileEditJobDescription,
              maxLines: 5,
              onSaved: (newValue) {
                jobDescriptionController.text = newValue ?? jobDescriptionController.text;
              },
              controller: jobDescriptionController,
            ),
          ),
          CustomElevatedButton(
              text: "Ekle",
              onPressed: () {
                if (_areControllersValid()) {
                  _addWorkLife;
                }
              }),
          ...state.works.map((work) {
            return InputText(
              child: CustomCard(
                startDate: work['worklifeStart'],
                endDate: work['workStatu'] == 'true' ? 'Devam Ediyor' : work['worklifeEnd'],
                title: TobetoText.profileEditWorkplaceName,
                content: work['workplaceName'],
                title2: TobetoText.profileEditPosition,
                content2: work['position'],
                title3: TobetoText.profileEditSector,
                content3: work['sector'],
                title4: TobetoText.profileEditCity,
                content4: work['workplaceLocation'],
                onpressed: () {
                  context.read<WorkLifeBloc>().add(RemoveWorkLife(work));
                },
              ),
            );
          }),
        ],
      );
    });
  }
}

// class WorkLife extends StatefulWidget {
//   const WorkLife({super.key});

//   @override
//   State<WorkLife> createState() => _WorkLifeState();
// }

// final _formKey = GlobalKey<FormState>();
// final TextEditingController workplaceNameController = TextEditingController();
// final TextEditingController positionController = TextEditingController();
// final TextEditingController experienceTypeController = TextEditingController();
// final TextEditingController sectorController = TextEditingController();
// final TextEditingController workplaceLocationController = TextEditingController();
// final TextEditingController worklifeStartController = TextEditingController();
// final TextEditingController worklifeEndController = TextEditingController();
// final TextEditingController jobDescriptionController = TextEditingController();
// final TextEditingController workStatuController = TextEditingController();
// final UserRepository workLifeRepository = UserRepository();
// bool isChecked = false;

// class _WorkLifeState extends State<WorkLife> {
//   void clearControllers() {
//     workplaceNameController.clear();
//     positionController.clear();
//     experienceTypeController.clear();
//     sectorController.clear();
//     workplaceLocationController.clear();
//     worklifeStartController.clear();
//     worklifeEndController.clear();
//     jobDescriptionController.clear();
//     workStatuController.clear();
//   }

//   @override
//   void initState() {
//     super.initState();
//     isChecked = workStatuController.text.toLowerCase() == 'true';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             InputText(
//               child: CustomTextField(
//                 title: TobetoText.profileEditWorkplaceName,
//                 onSaved: (newValue) {
//                   workplaceNameController.text = newValue ?? workplaceNameController.text;
//                 },
//                 controller: workplaceNameController,
//               ),
//             ),
//             InputText(
//               child: CustomTextField(
//                 title: TobetoText.profileEditPosition,
//                 onSaved: (newValue) {
//                   positionController.text = newValue ?? positionController.text;
//                 },
//                 controller: positionController,
//               ),
//             ),
//             InputText(
//               child: CustomDropDownInput(
//                 onChanged: (newValue) {
//                   experienceTypeController.text = newValue ?? experienceTypeController.text;
//                 },
//                 items: TobetoText.profileEditExperienceTypeList
//                     .map((label) => DropdownMenuItem(
//                           value: label,
//                           child: Text(label),
//                         ))
//                     .toList(),
//                 title: experienceTypeController.text.isNotEmpty
//                     ? experienceTypeController.text
//                     : TobetoText.profileEditExperienceType,
//                 controller: experienceTypeController,
//               ),
//             ),
//             InputText(
//               child: CustomTextField(
//                 title: TobetoText.profileEditSector,
//                 onSaved: (newValue) {
//                   sectorController.text = newValue ?? sectorController.text;
//                 },
//                 controller: sectorController,
//               ),
//             ),
//             InputText(
//               child: CustomTextField(
//                 title: TobetoText.profileEditWorkplaceLocation,
//                 onSaved: (newValue) {
//                   workplaceLocationController.text = newValue ?? workplaceLocationController.text;
//                 },
//                 controller: workplaceLocationController,
//               ),
//             ),
//             InputText(
//               child: DateFormatField(
//                 controller: worklifeStartController,
//                 decoration: InputDecoration(
//                   focusedBorder: const OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     borderSide: BorderSide(color: TobetoColor.purple, width: 2.0),
//                   ),
//                   labelText: TobetoText.profileEditStartJobDate,
//                   labelStyle: TobetoTextStyle.poppins(context).bodyGrayLightNormal16,
//                   floatingLabelStyle: TobetoTextStyle.poppins(context).captionPurpleNormal18,
//                   border: const OutlineInputBorder(
//                       borderRadius: BorderRadius.all(
//                     Radius.circular(12),
//                   )),
//                   enabledBorder: const OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.transparent, width: 1.0),
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                   ),
//                 ),
//                 type: DateFormatType.type2,
//                 onComplete: (date) {
//                   debugPrint("$date");
//                 },
//               ),
//             ),
//             if (!isChecked) ...[
//               InputText(
//                 child: DateFormatField(
//                   controller: worklifeEndController,
//                   decoration: InputDecoration(
//                     focusedBorder: const OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       borderSide: BorderSide(color: TobetoColor.purple, width: 2.0),
//                     ),
//                     labelText: TobetoText.profileEditFinishJobDate,
//                     labelStyle: TobetoTextStyle.poppins(context).bodyGrayLightNormal16,
//                     floatingLabelStyle: TobetoTextStyle.poppins(context).captionPurpleNormal18,
//                     border: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                       Radius.circular(12),
//                     )),
//                     enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.transparent, width: 1.0),
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                   ),
//                   type: DateFormatType.type2,
//                   onComplete: (date) {
//                     debugPrint("$date");
//                   },
//                 ),
//               ),
//             ],
//             Row(
//               children: [
//                 CustomCheckbox(
//                   onChanged: (value) {
//                     setState(() {
//                       isChecked = value!;
//                       if (isChecked) {
//                         worklifeEndController.clear();
//                       }
//                       workStatuController.text = isChecked.toString();
//                     });
//                   },
//                   value: isChecked,
//                   controller: workStatuController,
//                 ),
//                 Text(
//                   TobetoText.profileEditExperienceContinueBox,
//                   style: TobetoTextStyle.poppins(context).captionBlackSemiBold15,
//                 ),
//               ],
//             ),
//             InputText(
//               child: CustomTextField(
//                 title: TobetoText.profileEditJobDescription,
//                 maxLines: 5,
//                 onSaved: (newValue) {
//                   jobDescriptionController.text = newValue ?? jobDescriptionController.text;
//                 },
//                 controller: jobDescriptionController,
//               ),
//             ),
//             CustomElevatedButton(
//               text: "Ekle",
//               onPressed: () {
//                 _formKey.currentState!.save();
//                 workLifeRepository.addWorkLife;
//                 clearControllers();
//               },
//             ),
//             StreamBuilder<List<Map<String, dynamic>>>(
//               stream: workLifeRepository.workLifeStream,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const CircularProgressIndicator();
//                 } else if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         Image.asset(ImagePath.profileEditNote),
//                         const Text('Henüz eklediğiniz bir iş deneyiminiz bulunmamaktadır.')
//                       ],
//                     ),
//                   );
//                 }

//                 List<Map<String, dynamic>> workLifeList = snapshot.data!;
//                 return ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: workLifeList.length,
//                   itemBuilder: (context, index) {
//                     Map<String, dynamic> workLife = workLifeList[index];
//                     return InputText(
//                       child: CustomCard(
//                         startDate: workLife['worklifeStart'],
//                         endDate: workLife['workStatu'] == 'true' ? 'Devam Ediyor' : workLife['worklifeEnd'],
//                         title: TobetoText.profileEditWorkplaceName,
//                         content: workLife['workplaceName'],
//                         title2: TobetoText.profileEditPosition,
//                         content2: workLife['position'],
//                         title3: TobetoText.profileEditSector,
//                         content3: workLife['sector'],
//                         title4: TobetoText.profileEditCity,
//                         content4: workLife['workplaceLocation'],
//                         onpressed: () {
//                           workLifeRepository.removeWorkLife(workLife);
//                         },
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
