import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_mobile_app/blocs/survey_bloc/survey_bloc.dart';
import 'package:tobeto_mobile_app/model/survey_model.dart';
import '../survey_screen/survey_widgets/survey_card.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  String? userId;
  String? surveyId;

  @override
  void initState() {
    super.initState();
    _initializeUserAndSurvey();
  }

  Future<void> _initializeUserAndSurvey() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId = user.uid;
      DocumentSnapshot surveyDoc = await FirebaseFirestore.instance
          .collection('surveys')
          .doc('uVhMmvdqeWXX3AW5oGTI')
          .get();

      surveyId = surveyDoc.id;

      setState(() {});
    } else {
      // Kullanıcı oturum açmamışsa hata ver
      throw Exception('User is not authenticated');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (userId == null || surveyId == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return BlocProvider(
      create: (_) => SurveyBloc()..add(LoadSurveys()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Anketler'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<SurveyBloc, SurveyState>(
            builder: (context, state) {
              if (state is SurveyLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SurveyLoaded) {
                return ListView.builder(
                  itemCount: state.surveys.length,
                  itemBuilder: (context, index) {
                    final survey = state.surveys[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SurveyDetailScreen(
                              userId: userId!,
                              surveyId: surveyId!,
                              surveyTitle: survey.title,
                            ),
                          ),
                        ),
                        child: SurveyCard(
                          headline: survey.title,
                          lineerColor1: TobetoColor.purple,
                          lineerColor2: TobetoColor.purple,
                          isThereButton: true,
                        ),
                      ),
                    );
                  },
                );
              } else if (state is SurveyError) {
                return Center(child: Text(state.error));
              } else {
                return const Center(child: Text('Bir hata oluştu.'));
              }
            },
          ),
        ),
      ),
    );
  }
}

class SurveyDetailScreen extends StatefulWidget {
  final String userId;
  final String surveyId;
  final String surveyTitle;

  const SurveyDetailScreen({
    super.key,
    required this.userId,
    required this.surveyId,
    required this.surveyTitle,
  });

  @override
  State<SurveyDetailScreen> createState() => _SurveyDetailScreenState();
}

class _SurveyDetailScreenState extends State<SurveyDetailScreen> {
  List<SurveyModel> surveyQuestions = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SurveyBloc>(context)
        .add(LoadSurveyDetails(surveyId: widget.surveyId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surveyTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<SurveyBloc, SurveyState>(
        builder: (context, state) {
          if (state is SurveyLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SurveyDetailsLoaded) {
            surveyQuestions = state.questions;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: surveyQuestions.length,
                    itemBuilder: (context, index) {
                      final question = surveyQuestions[index];
                      return Card(
                        color: TobetoColor.card.cream,
                        elevation: 2.0,
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                question.question,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              ...question.options.map((option) {
                                return ListTile(
                                  title: Text(option),
                                  textColor: Colors.black,
                                  leading: Radio<String>(
                                    value: option,
                                    groupValue: question.selected,
                                    onChanged: (value) {
                                      setState(() {
                                        question.selected = value;
                                      });
                                    },
                                    activeColor: TobetoColor.purple,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      question.selected = option;
                                    });
                                  },
                                );
                              }),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<SurveyBloc>(context).add(SaveAnswers(
                        userId: widget.userId,
                        surveyId: widget.surveyId,
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Cevaplar kaydedildi!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TobetoColor.purple,
                      textStyle: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                    ),
                    child: const Text('Kaydet'),
                  ),
                ),
              ],
            );
          } else if (state is SurveyError) {
            return Center(child: Text(state.error));
          } else {
            return const Center(child: Text('Bir hata oluştu.'));
          }
        },
      ),
    );
  }
}
