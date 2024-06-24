import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/social_media_bloc/social_media_bloc.dart';
import 'package:tobeto_mobile_app/blocs/social_media_bloc/social_media_event.dart';
import 'package:tobeto_mobile_app/blocs/social_media_bloc/social_media_state.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_column.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_dropdown_input.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_mini_card.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_title.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  final TextEditingController socialMediaNameController = TextEditingController();
  final TextEditingController socialMediaLinkController = TextEditingController();

  void _clearControllers() {
    socialMediaNameController.clear();
    socialMediaLinkController.clear();
  }

  bool _areControllersValid() {
    return socialMediaNameController.text.isNotEmpty && socialMediaLinkController.text.isNotEmpty;
  }

  void _addEducationLife() {
    final projects = {
      'socialMediaName': socialMediaNameController.text,
      'socialMediaLink': socialMediaLinkController.text,
    };
    context.read<SocialMediaBloc>().add(AddSocialMedia(projects));
    _clearControllers();
  }

  Map<String, String> socialMediaIcons = {
    'Facebook': ImagePath.facebook,
    'Twitter': ImagePath.blackX,
    'Instagram': ImagePath.instagram,
    'LinkedIn': ImagePath.linkedin,
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialMediaBloc, SocialMediaState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.error != null) {
        return Center(child: Text('Error: ${state.error}'));
      }
      return ListView(
        children: [
          CustomTitle(title: TobetoText.profileEditSocialMedia),
          InputText(
              child: CustomDropDownInput(
            onChanged: (newValue) {
              socialMediaNameController.text = newValue ?? socialMediaNameController.text;
            },
            items: TobetoText.socialMediaName
                .map((label) => DropdownMenuItem(
                      value: label,
                      child: Text(label),
                    ))
                .toList(),
            title: TobetoText.profileEditSocialMediaName,
            controller: socialMediaNameController,
          )),
          InputText(
              child: CustomTextField(
            title: TobetoText.profileEditSocialMediaLink,
            controller: socialMediaLinkController,
          )),
          CustomElevatedButton(
            onPressed: () {
              if (_areControllersValid()) {
                _addEducationLife();
              }
            },
          ),
          if (state.media.isEmpty)
            CustomColumn(title: TobetoText.emptySocialMedia)
          else
            ...state.media.map((media) {
              final socialMediaName = media['socialMediaName'];
              final iconPath = socialMediaIcons[socialMediaName] ?? '';
              return InputText(
                  child: CustomMiniCard(
                imagepath: Image.asset(iconPath),
                onpressed: () {
                  context.read<SocialMediaBloc>().add(RemoveSocialMedia(media));
                },
                title: media['socialMediaLink'],
              ));
            })
        ],
      );
    });
  }
}
