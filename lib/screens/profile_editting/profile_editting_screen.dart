import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_event.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_state.dart';

class UserPage extends StatelessWidget {
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
              final user = state.user;
              final experiences = state.experiences;
              final education = state.education;
              final competencies = state.competencies;
              final certificates = state.certificates;
              final communities = state.communities;
              final projectsAndAwards = state.projectsAndAwards;
              final mediaAccounts = state.mediaAccounts;
              final foreignLanguages = state.foreignLanguages;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text('Hakkımda'),
                      subtitle: Text(user.aboutMe ?? 'Bilinmiyor'),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Deneyimler'),
                      subtitle: Column(
                        children: experiences.map((experience) {
                          return ListTile(
                            title: Text(experience.position),
                            subtitle: Text(experience.companyName),
                          );
                        }).toList(),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Eğitim'),
                      subtitle: ListTile(
                        title: Text(education.university ?? 'Bilinmiyor'),
                        subtitle: Text(education.section ?? 'Bilinmiyor'),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Yetkinlikler'),
                      subtitle: Column(
                        children: competencies.competencies.map((competency) {
                          return ListTile(
                            title: Text(competency),
                          );
                        }).toList(),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Sertifikalar'),
                      subtitle: Column(
                        children: certificates.map((certificate) {
                          return ListTile(
                            title: Text(certificate.fileName),
                            subtitle: Text(certificate.fileType),
                          );
                        }).toList(),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Topluluklar'),
                      subtitle: Column(
                        children: communities.map((community) {
                          return ListTile(
                            title: Text(community.name),
                            subtitle: Text(community.titleOrPosition),
                          );
                        }).toList(),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Projeler ve Ödüller'),
                      subtitle: Column(
                        children: projectsAndAwards.map((projectOrAward) {
                          return ListTile(
                            title: Text(projectOrAward.projectOrAward),
                            subtitle: Text(projectOrAward.history.toString()),
                          );
                        }).toList(),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Sosyal Medya Hesapları'),
                      subtitle: Column(
                        children: [
                          ListTile(
                            title: const Text('Behance'),
                            subtitle: Text(mediaAccounts.behance ?? 'Bilinmiyor'),
                          ),
                          ListTile(
                            title: const Text('Dribble'),
                            subtitle: Text(mediaAccounts.dribble ?? 'Bilinmiyor'),
                          ),
                          ListTile(
                            title: const Text('Instagram'),
                            subtitle: Text(mediaAccounts.instagram ?? 'Bilinmiyor'),
                          ),
                          ListTile(
                            title: const Text('LinkedIn'),
                            subtitle: Text(mediaAccounts.linkedIn ?? 'Bilinmiyor'),
                          ),
                          ListTile(
                            title: const Text('Twitter'),
                            subtitle: Text(mediaAccounts.twitter ?? 'Bilinmiyor'),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Yabancı Diller'),
                      subtitle: ListTile(
                        title: Text(foreignLanguages.languageName ?? 'Bilinmiyor'),
                        subtitle: Text(foreignLanguages.languageLevel ?? 'Bilinmiyor'),
                      ),
                    ),
                    // Diğer kullanıcı bilgileri burada gösterilebilir
                    // Örneğin: Ad, Soyad, Email, Telefon gibi
                    ListTile(
                      title: const Text('Ad'),
                      subtitle: Text(user.firstName ?? 'Bilinmiyor'),
                    ),
                    ListTile(
                      title: const Text('Soyad'),
                      subtitle: Text(user.lastName ?? 'Bilinmiyor'),
                    ),
                    ListTile(
                      title: const Text('Email'),
                      subtitle: Text(user.email ?? 'Bilinmiyor'),
                    ),
                    ListTile(
                      title: const Text('Telefon Numarası'),
                      subtitle: Text(user.phoneNumber ?? 'Bilinmiyor'),
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
