import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_mini_card.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/services/user_service.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';

class Competencies extends StatefulWidget {
  const Competencies({super.key});

  @override
  State<Competencies> createState() => _CompetenciesState();
}

class _CompetenciesState extends State<Competencies> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController skillController = TextEditingController();
  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputText(
            child: CustomTextField(
              title: TobetoText.profileEditSkill,
              onSaved: (newValue) {
                skillController.text = newValue ?? skillController.text;
              },
              controller: skillController,
            ),
          ),
          CustomElevatedButton(
            text: "Ekle",
            onPressed: () {
              if (skillController.text.isNotEmpty) {
                userRepository.addSkill(skillController.text);
                skillController.clear();
              }
            },
          ),
          Expanded(
            child: StreamBuilder<List<String>>(
              stream: userRepository.skillsStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(ImagePath.profileEditNote),
                        Text('Henüz ekledğiniz bir yetkinliğiniz bulunmamaktadır.')
                      ],
                    ),
                  );
                }

                List<String> skills = snapshot.data!;
                return ListView.builder(
                  itemCount: skills.length,
                  itemBuilder: (context, index) {
                    String skill = skills[index];
                    return InputText(
                      child: CustomMiniCard(
                        onpressed: () {
                          userRepository.removeSkill(skill);
                        },
                        title: skill,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
