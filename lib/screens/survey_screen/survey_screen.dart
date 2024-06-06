import 'package:flutter/material.dart';
import '../survey_screen/survey_widgets/survey_card.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class SurveyScreen extends StatelessWidget {
  final List<String> surveys = [
    'Anket 1',
    'Anket 2',
    'Anket 3',
  ];

  void navigateToSurvey(BuildContext context, String surveyTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SurveyDetailScreen(surveyTitle: surveyTitle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anketler'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: surveys.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GestureDetector(
                onTap: () => navigateToSurvey(context, surveys[index]),
                child: SurveyCard(
                  headline: surveys[index],
                  lineerColor1: TobetoColor.purple,
                  lineerColor2: TobetoColor.purple,
                  isThereButton: true,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SurveyDetailScreen extends StatefulWidget {
  final String surveyTitle;

  SurveyDetailScreen({required this.surveyTitle});

  @override
  _SurveyDetailScreenState createState() => _SurveyDetailScreenState();
}

class _SurveyDetailScreenState extends State<SurveyDetailScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Bu eğitimden ne kadar memnun kaldınız?',
      'options': ['Çok memnun', 'Memnun', 'Kararsız', 'Memnun değil', 'Hiç memnun değil'],
      'selected': null,
    },
    {
      'question': 'Eğitimin içeriği yeterli miydi?',
      'options': ['Çok yeterli', 'Yeterli', 'Kararsız', 'Yetersiz', 'Çok yetersiz'],
      'selected': null,
    },
    {
      'question': 'Eğitmen konuları iyi anlattı mı?',
      'options': ['Evet, çok iyi', 'Evet', 'Kısmen', 'Hayır', 'Hiç iyi değil'],
      'selected': null,
    },
  ];

  void _handleRadioValueChange(int questionIndex, String? value) {
    setState(() {
      questions[questionIndex]['selected'] = value;
    });
  }

  void _saveAnswers() {
    for (var question in questions) {
      print('Soru: ${question['question']}');
      print('Seçilen: ${question['selected']}');
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Cevaplar kaydedildi!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surveyTitle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: questions.length,
              itemBuilder: (context, index) {
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
                          questions[index]['question'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        ...questions[index]['options'].map<Widget>((option) {
                          return ListTile(
                            title: Text(option),
                            textColor: Colors.black,
                            leading: Radio<String>(
                              value: option,
                              groupValue: questions[index]['selected'],
                              onChanged: (value) {
                                _handleRadioValueChange(index, value);
                              },
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              activeColor: TobetoColor.purple,
                            ),
                          );
                        }).toList(),
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
              style: elevatedButtonStyle(),
              onPressed: _saveAnswers,
              child: Text('Kaydet'),
            ),
          ),
        ],
      ),
    );
  }
}
