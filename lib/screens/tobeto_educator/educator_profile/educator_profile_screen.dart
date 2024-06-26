import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tobeto_mobile_app/blocs/certificate_bloc/certificate_state.dart';
import 'package:tobeto_mobile_app/blocs/export_bloc.dart';
import 'package:tobeto_mobile_app/blocs/profile_photo_bloc/profile_photo_state.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_state.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/profile_editting_screen.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/screen/personal_information.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_title.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class ProfileScreenEducator extends StatefulWidget {
  const ProfileScreenEducator({super.key});

  @override
  State<ProfileScreenEducator> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreenEducator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FixedAppbar(
        isLeading: false,
        title: Text(
          "Profil",
          style: TobetoTextStyle.poppins(context).subHeadlinePurpleBold28,
        ),
      ),
      body: ListView(
        children: const [
          ProfilePhotoView(),
          PersonalInfo(),
        ],
      ),
    );
  }
}

class ProfilePhotoView extends StatefulWidget {
  const ProfilePhotoView({super.key});

  @override
  State<ProfilePhotoView> createState() => _ProfilePhotoViewState();
}

class _ProfilePhotoViewState extends State<ProfilePhotoView> {
  File? _selectedImage;

  void _pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
      }
    } catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePhotoBloc, ProfilePhotoState>(
      builder: (context, state) {
        if (state is ProfilePhotoLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProfilePhotoLoaded) {
          String imageUrl = state.imageUrl;
          bool hasImageUrl = imageUrl.isNotEmpty;
          return Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 75,
                    foregroundImage: _selectedImage != null
                        ? FileImage(_selectedImage!)
                        : hasImageUrl
                            ? NetworkImage(imageUrl)
                            : const AssetImage(ImagePath.defaultProfilePhoto)
                                as ImageProvider,
                  ),
                  CircleAvatar(
                    backgroundColor: TobetoColor.card.white,
                    radius: 20,
                    child: IconButton(
                      onPressed: _pickImage,
                      icon: const Icon(
                        Icons.edit,
                        color: TobetoColor.purple,
                      ),
                    ),
                  ),
                ],
              ),
              if (_selectedImage != null)
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<ProfilePhotoBloc>()
                        .add(UpdateProfilePhoto(_selectedImage!));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: TobetoColor.purple),
                  child: Text(TobetoText.profileEditSaveButton),
                ),
            ],
          );
        } else if (state is ProfilePhotoError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No profile photo loaded.'));
        }
      },
    );
  }
}

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is UserLoaded) {
        return Column(
          children: [
            MainTitleCard(
              iconAndTexts: [
                IconAndText(
                  icon: ImagePath.user,
                  text: TobetoText.profileName,
                  value:
                      '${firstNameController.text} ${lastNameController.text}',
                ),
                IconAndText(
                  icon: ImagePath.birthdate,
                  text: TobetoText.profileBirthday,
                  value: birthDateController.text,
                ),
                IconAndText(
                  icon: ImagePath.mail,
                  text: TobetoText.profileEmail,
                  value: emailController.text,
                ),
                IconAndText(
                  icon: ImagePath.phone,
                  text: TobetoText.profilePhoneNumber,
                  value: phoneNumberController.text,
                ),
                IconAndText(
                  icon: ImagePath.gender,
                  text: TobetoText.profileGender,
                  value: genderController.text,
                ),
                IconAndText(
                  icon: ImagePath.soldier,
                  text: TobetoText.profileMilitaryStuation,
                  value: militaryStatuController.text,
                ),
                IconAndText(
                  icon: ImagePath.disabled,
                  text: TobetoText.profileDisableStuation,
                  value: disabledStatuController.text,
                ),
              ],
            ),
          ],
        );
      } else if (state is UserError) {
        return Center(child: Text('Error: ${state.message}'));
      } else {
        return const Center(child: Text('Bir hata oluştu.'));
      }
    });
  }
}

class MainTitleCard extends StatelessWidget {
  final List<IconAndText> iconAndTexts;

  const MainTitleCard({super.key, required this.iconAndTexts});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: double.infinity,
              ),
              child: Column(children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(SizeRadius.radius20px)),
                    color: Theme.of(context).colorScheme.onPrimary,
                    child: Padding(
                      padding: EdgeInsets.all(ScreenPadding.padding16px),
                      child: Column(
                        children: iconAndTexts,
                      ),
                    ),
                  ),
                )
              ]),
            ));
  }
}

class IconAndText extends StatelessWidget {
  final String icon;
  final String? text;
  final String? value;

  const IconAndText({
    super.key,
    required this.icon,
    this.text,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: ScreenUtil.getWidth(context) * 0.09,
            height: ScreenUtil.getHeight(context) * 0.07,
            child: Image.asset(
              icon,
              color: Theme.of(context).colorScheme.onSurface,
            )),
        SizedBox(width: ScreenPadding.padding16px),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text!,
                style: TobetoTextStyle.poppins(context).bodyGrayDarkSemiBold16),
            Text(value!,
                style: TobetoTextStyle.poppins(context).captionBlackBold18),
          ],
        ),
      ],
    );
  }
}

class TwoLineCard extends StatelessWidget {
  final String? line1;
  final String line2;

  const TwoLineCard({super.key, this.line1, required this.line2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeRadius.radius20px)),
        color: Theme.of(context).colorScheme.onPrimary,
        child: Padding(
          padding: EdgeInsets.all(ScreenPadding.padding12px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (line1 != null && line1!.isNotEmpty)
                Text(
                  line1!,
                  style: TobetoTextStyle.poppins(context).captionGrayNormal12,
                ),
              Text(
                line2,
                style: TobetoTextStyle.poppins(context).bodyGrayDarkSemiBold16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}