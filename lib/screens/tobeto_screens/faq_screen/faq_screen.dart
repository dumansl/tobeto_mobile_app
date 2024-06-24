import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/faq_bloc/faq_bloc.dart';
import 'package:tobeto_mobile_app/blocs/faq_bloc/faq_event.dart';
import 'package:tobeto_mobile_app/blocs/faq_bloc/faq_state.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/widgets/custom_dropdown_input.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

import '../widgets/description_title_content.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  String selectedCategory = 'tobeto';
  final Map<String, String> categoryTitles = {
    'tobeto': 'Tobeto',
    'education': 'Eğitim',
    'support': 'Destek'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sıkça Sorulan Sorular"),
      ),
      body: BlocProvider(
        create: (context) => FAQBloc()..add(FetchFAQs()),
        child: Padding(
          padding: EdgeInsets.all(ScreenPadding.padding24px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: ScreenPadding.padding16px),
                child: Text(
                  "S.S.S.",
                  style:
                      TobetoTextStyle.poppins(context).subtitleGrayDarkBold20,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: ScreenPadding.padding24px),
                child: CustomDropDownInput(
                  items: categoryTitles.keys.map((label) {
                    return DropdownMenuItem(
                      value: label,
                      child: Text(categoryTitles[label]!),
                    );
                  }).toList(),
                  title: "Tobeto",
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<FAQBloc, FAQState>(
                  builder: (context, state) {
                    if (state is FAQLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is FAQLoaded) {
                      final faqs = state.faqs[selectedCategory]!;
                      return ListView.builder(
                        itemCount: faqs.questions.length,
                        itemBuilder: (context, index) {
                          return DescriptionTitleContent(
                            title: faqs.questions[index],
                            description: faqs.answers[index],
                          );
                        },
                      );
                    } else if (state is FAQError) {
                      return Center(child: Text('Error: ${state.message}'));
                    } else {
                      return const Center(child: Text('Blinmedik durum'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
