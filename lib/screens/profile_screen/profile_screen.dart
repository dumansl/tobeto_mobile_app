import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tobeto_mobile_app/blocs/certificate_bloc/certificate_bloc.dart';
import 'package:tobeto_mobile_app/blocs/certificate_bloc/certificate_state.dart';
import 'package:tobeto_mobile_app/blocs/export_bloc.dart';
import 'package:tobeto_mobile_app/blocs/profile_photo_bloc/profile_photo_bloc.dart';
import 'package:tobeto_mobile_app/blocs/profile_photo_bloc/profile_photo_event.dart';
import 'package:tobeto_mobile_app/blocs/profile_photo_bloc/profile_photo_state.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_state.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/profile_editting_screen.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/screen/personal_information.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FixedAppbar(title: 'Profil', isDashboard: true),
      body: ListView(
        children: const [
          ProfilePhotoView(),
          PersonalInfo(),
          CompetenciesView(),
          MyLanguages(),
          MyCertificate(),
          Projects(),
          WorkExperience(),
          Club(),
          Education(),
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
                            : const AssetImage(ImagePath.defaultProfilePhoto) as ImageProvider,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
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
                    context.read<ProfilePhotoBloc>().add(UpdateProfilePhoto(_selectedImage!));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: TobetoColor.purple),
                  child: const Text('Kaydet'),
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
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileEditPage()));
                },
                icon: Image.asset(ImagePath.organizer),
              ),
            ),
            MainTitleCard(
              iconAndTexts: [
                IconAndText(
                  icon: ImagePath.user,
                  text: TobetoText.profileName,
                  value: '${firstNameController.text} ${lastNameController.text}',
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
            CustomTitle(title: TobetoText.profileAboutMe),
            TwoLineCard(
              line1: '',
              line2: aboutMeController.text.isNotEmpty
                  ? aboutMeController.text
                  : 'Henüz eklediğiniz bir hakkımda bilginiz bulunmamaktadır.',
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

class CompetenciesView extends StatelessWidget {
  const CompetenciesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompetenciesBloc, CompetenciesState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.error != null) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return Column(
          children: [
            CustomTitle(
              title: TobetoText.profileMySkills,
            ),
            if (state.skills.isEmpty)
              const TwoLineCard(line2: "Henüz eklediğiniz bir yetkinliğiniz bulunmamaktadır.")
            else
              ...state.skills.map((skill) {
                return TwoLineCard(
                  line2: skill,
                );
              }),
          ],
        );
      },
    );
  }
}

class MyLanguages extends StatelessWidget {
  const MyLanguages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguagesBloc, LanguagesState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.error != null) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return Column(
          children: [
            CustomTitle(title: TobetoText.profileLanguages),
            if (state.languages.isEmpty)
              const TwoLineCard(line2: "Henüz eklediğiniz bir diliniz bulunmamaktadır.")
            else
              ...state.languages.map((languages) {
                return TwoLineCard(
                  line2: languages['languageName'],
                  line1: languages['languageLevel'],
                );
              })
          ],
        );
      },
    );
  }
}

class MyCertificate extends StatelessWidget {
  const MyCertificate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CertificateBloc, CertificateState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.error != null) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return Column(
          children: [
            CustomTitle(title: TobetoText.profileMyCertificate),
            if (state.certificate.isEmpty)
              const TwoLineCard(line2: "Henüz eklediğiniz bir sertifikanız bulunmamaktadır.")
            else
              ...state.certificate.map((certificate) {
                return TwoLineCard(
                  line2: certificate['certificatesName'],
                  line1: certificate['certificateDate'],
                );
              })
          ],
        );
      },
    );
  }
}

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsPrizeBloc, ProjectsPrizeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.error != null) {
          return Center(child: Text('Error: ${state.error}'));
        }

        return Column(
          children: [
            CustomTitle(title: TobetoText.profileProjectAwards),
            if (state.projects.isEmpty)
              const TwoLineCard(line2: "Henüz eklediğiniz bir proje veya ödülünüz bulunmamaktadır.")
            else
              ...state.projects.map((projects) {
                return TwoLineCard(
                  line2: projects['projectAwardName'],
                  line1: projects['certificatesDate'],
                );
              })
          ],
        );
      },
    );
  }
}

class WorkExperience extends StatelessWidget {
  const WorkExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkLifeBloc, WorkLifeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.error != null) {
          return Center(child: Text('Error: ${state.error}'));
        }

        return Column(
          children: [
            const CustomTitle(title: 'İş Deneyimleri'),
            if (state.works.isEmpty)
              const TwoLineCard(line2: "Henüz eklediğiniz bir iş deneyiminiz bulunmamaktadır.")
            else
              ...state.works.map((work) {
                return TwoLineCard(
                  line2: work['workplaceName'],
                  line1: work['position'],
                );
              })
          ],
        );
      },
    );
  }
}

class Club extends StatelessWidget {
  const Club({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClubCominitiesBloc, ClubCominitiesState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.error != null) {
          return Center(child: Text('Error: ${state.error}'));
        }

        return Column(
          children: [
            CustomTitle(title: TobetoText.profileCommunity),
            if (state.club.isEmpty)
              const TwoLineCard(line2: "Henüz eklediğiniz bir kulüp veya topluluğunuz bulunmamaktadır.")
            else
              ...state.club.map((club) {
                return TwoLineCard(
                  line2: club['communityName'],
                  line1: club['communityTitle'],
                );
              })
          ],
        );
      },
    );
  }
}

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EducationLifeBloc, EducationLifeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.error != null) {
          return Center(child: Text('Error: ${state.error}'));
        }

        return Column(
          children: [
            CustomTitle(title: TobetoText.profileEducations),
            if (state.education.isEmpty)
              const TwoLineCard(line2: "Henüz eklediğiniz bir eğitim bilginiz bulunmamaktadır.")
            else
              ...state.education.map((education) {
                return TwoLineCard(
                  line2: education['univercity'],
                  line1: education['educationStatu'],
                );
              })
          ],
        );
      },
    );
  }
}

class MainTitleCard extends StatelessWidget {
  final List<IconAndText> iconAndTexts;

  const MainTitleCard({super.key, required this.iconAndTexts});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 0,
                maxHeight: double.infinity,
              ),
              child: Column(children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Theme.of(context).colorScheme.onPrimary,
                    margin: const EdgeInsets.only(bottom: 5),
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
            width: 40,
            height: 40,
            child: Image.asset(
              icon,
              color: Theme.of(context).colorScheme.onSurface,
            )),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text!, style: TobetoTextStyle.poppins(context).bodyGrayDarkSemiBold16),
            Text(value!, style: TobetoTextStyle.poppins(context).captionBlackBold18),
            const SizedBox(height: 8)
          ],
        ),
      ],
    );
  }
}

class TitleCard extends StatelessWidget {
  final String title;
  final Widget content;
  final Function()? onTap;
  final String? icon;

  const TitleCard({
    super.key,
    required this.title,
    required this.content,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        margin: const EdgeInsets.only(bottom: 5),
        child: Padding(
          padding: EdgeInsets.all(ScreenPadding.padding16px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: TobetoTextStyle.poppins(context).bodyBlackBold16),
                  if (icon != null)
                    InkWell(
                      onTap: onTap,
                      child: Image.asset(icon!),
                    ),
                ],
              ),
              const Divider(
                thickness: 0.7,
                color: TobetoColor.purple,
              ),
              content,
            ],
          ),
        ),
      ),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: Theme.of(context).colorScheme.onPrimary,
        margin: const EdgeInsets.only(bottom: 5),
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

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TobetoTextStyle.poppins(context).bodyBlackBold16),
          const Divider(
            thickness: 0.7,
            color: TobetoColor.purple,
          ),
        ],
      ),
    );
  }
}
