import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_event.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_state.dart';
import 'package:tobeto_mobile_app/model/user_model.dart'; // User model import

class ProfileScreen2 extends StatelessWidget {
  const ProfileScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc()..add(FetchUserData()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kullanıcı Bilgileri'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserLoaded) {
              final UserModel user = state.user;
              final List<ExperienceModel>? experiences = state.experiences;
              final List<EducationModel>? educations = state.educations;
              final CompetencyModel? competencies = state.competencies;
              final List<CertificateModel>? certificates = state.certificates;
              final List<CommunityModel>? communities = state.communities;
              final List<ProjectOrAwardModel>? projectsAndAwards =
                  state.projectsAndAwards;
              final MediaAccountModel? mediaAccounts = state.mediaAccounts;
              final List<ForeignLanguageModel>? foreignLanguages =
                  state.foreignLanguages;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text('Hakkımda'),
                      subtitle: Text(user.aboutMe!),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Deneyimler'),
                      subtitle: Column(
                        children: experiences?.map((experience) {
                              return ListTile(
                                title: Text(experience.position),
                                subtitle: Text(experience.companyName),
                              );
                            }).toList() ??
                            [],
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Eğitim'),
                      subtitle: Column(
                        children: educations?.map((education) {
                              return ListTile(
                                title: Text(education.university!),
                                subtitle: Text(education.section!),
                              );
                            }).toList() ??
                            [],
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Yetkinlikler'),
                      subtitle: Column(
                        children: competencies?.competencies?.map((competency) {
                              return ListTile(
                                title: Text(competency),
                              );
                            }).toList() ??
                            [],
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Sertifikalar'),
                      subtitle: Column(
                        children: certificates?.map((certificate) {
                              return ListTile(
                                title: Text(certificate.fileName!),
                                subtitle: Text(certificate.fileType!),
                              );
                            }).toList() ??
                            [],
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Topluluklar'),
                      subtitle: Column(
                        children: communities?.map((community) {
                              return ListTile(
                                title: Text(community.name!),
                                subtitle: Text(community.titleOrPosition ?? ''),
                              );
                            }).toList() ??
                            [],
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Projeler ve Ödüller'),
                      subtitle: Column(
                        children: projectsAndAwards?.map((projectOrAward) {
                              return ListTile(
                                title: Text(projectOrAward.projectOrAward),
                                subtitle:
                                    Text(projectOrAward.history.toString()),
                              );
                            }).toList() ??
                            [],
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Sosyal Medya Hesapları'),
                      subtitle: Column(
                        children: [
                          if (mediaAccounts?.behance != null)
                            ListTile(
                              title: const Text('Behance'),
                              subtitle: Text(mediaAccounts!.behance),
                            ),
                          if (mediaAccounts?.dribble != null)
                            ListTile(
                              title: const Text('Dribble'),
                              subtitle: Text(mediaAccounts!.dribble),
                            ),
                          if (mediaAccounts?.instagram != null)
                            ListTile(
                              title: const Text('Instagram'),
                              subtitle: Text(mediaAccounts!.instagram),
                            ),
                          if (mediaAccounts?.linkedIn != null)
                            ListTile(
                              title: const Text('LinkedIn'),
                              subtitle: Text(mediaAccounts!.linkedIn),
                            ),
                          if (mediaAccounts?.twitter != null)
                            ListTile(
                              title: const Text('Twitter'),
                              subtitle: Text(mediaAccounts!.twitter),
                            ),
                        ],
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Yabancı Diller'),
                      subtitle: Column(
                        children: foreignLanguages?.map((language) {
                              return ListTile(
                                title: Text(language.languageName),
                                subtitle: Text(language.languageLevel),
                              );
                            }).toList() ??
                            [],
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Ad'),
                      subtitle: Text(user.firstName),
                    ),
                    ListTile(
                      title: const Text('Soyad'),
                      subtitle: Text(user.lastName),
                    ),
                    ListTile(
                      title: const Text('Email'),
                      subtitle: Text(user.email),
                    ),
                    ListTile(
                      title: const Text('Telefon Numarası'),
                      subtitle: Text(user.phoneNumber!),
                    ),
                  ],
                ),
              );
            } else if (state is UserError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Veri bulunamadı'));
            }
          },
        ),
      ),
    );
  }
}
