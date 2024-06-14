import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_mini_card.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class Competencies extends StatefulWidget {
  const Competencies({super.key});

  @override
  State<Competencies> createState() => _CompetenciesState();
}

final TextEditingController skillController = TextEditingController();

class _CompetenciesState extends State<Competencies> {
  final _formKey = GlobalKey<FormState>();
  List<String> skills = [];
  final userId = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadSkills();
  }

  Future<void> _loadSkills() async {
    try {
      DocumentSnapshot doc = await db.collection('users').doc(userId).get();
      if (doc.exists) {
        var data = doc.data() as Map<String, dynamic>;
        setState(() {
          skills = List<String>.from(data['skill'] ?? []);
        });
      }
    } catch (e) {
      print("Failed to load skills: $e");
    }
  }

  Future<void> _addSkill(String skill) async {
    setState(() {
      skills.add(skill);
    });
    await db.collection('users').doc(userId).update({
      'skill': FieldValue.arrayUnion([skill])
    });
  }

  Future<void> _removeSkill(String skill) async {
    setState(() {
      skills.remove(skill);
    });
    await db.collection('users').doc(userId).update({
      'skill': FieldValue.arrayRemove([skill])
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
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
                _addSkill(skillController.text);
                skillController.clear();
              }
            },
          ),
          ...skills.map((skill) {
            return InputText(
              child: CustomMiniCard(
                onpressed: () {
                  _removeSkill(skill);
                },
                title: skill,
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
