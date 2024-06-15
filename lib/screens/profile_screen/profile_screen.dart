import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_event.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_state.dart';
import 'package:tobeto_mobile_app/model/user_model.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  late UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.add(FetchUserData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Düzenleme'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserLoaded) {
            return _buildProfileEditForm(state.user);
          } else if (state is UserError) {
            return Center(
              child: Text('Hata: ${state.message}'),
            );
          } else {
            return Center(
              child: Text('Bilinmeyen bir hata oluştu.'),
            );
          }
        },
      ),
    );
  }

  Widget _buildProfileEditForm(UserModel user) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            initialValue: user.firstName,
            decoration: InputDecoration(labelText: 'Ad Soyad'),
            onChanged: (value) {
              user.firstName = value;
            },
          ),
          SizedBox(height: 12.0),
          TextFormField(
            initialValue: user.email,
            decoration: InputDecoration(labelText: 'E-posta'),
            onChanged: (value) {
              user.email = value;
            },
          ),
          SizedBox(height: 24.0),
          _buildExperienceSection(user.experiences),
          SizedBox(height: 24.0),
          _buildEducationSection(user.educations),
          SizedBox(height: 24.0),
          _buildCertificateSection(user.certificates),
          SizedBox(height: 24.0),
          _buildCommunitySection(user.communities),
          SizedBox(height: 24.0),
          _buildProjectOrAwardSection(user.projectsAndAwards),
          SizedBox(height: 24.0),
          _buildForeignLanguageSection(user.foreignLanguages),
          SizedBox(height: 24.0),
          _buildMediaAccountSection(user.mediaAccounts),
          SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {
              _userBloc.add(UpdateUser(user));
              Navigator.of(context).pop(); // Profil düzenleme ekranından çık
            },
            child: Text('Kaydet'),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceSection(List<ExperienceModel>? experiences) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Deneyimler',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.0),
        // Deneyimleri listelemek ve düzenlemek için gerekli widget'lar buraya eklenecek
        // Örneğin: ExperienceWidget(experiences: experiences),
        // ExperienceWidget içinde ekleme, güncelleme, silme işlevleri tetiklenecek
      ],
    );
  }

  Widget _buildEducationSection(List<EducationModel>? educations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Eğitim',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.0),
        // Eğitimleri listelemek ve düzenlemek için gerekli widget'lar buraya eklenecek
      ],
    );
  }

  Widget _buildCertificateSection(List<CertificateModel>? certificates) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Sertifikalar',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.0),
        // Sertifikaları listelemek ve düzenlemek için gerekli widget'lar buraya eklenecek
      ],
    );
  }

  Widget _buildCommunitySection(List<CommunityModel>? communities) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Topluluklar',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.0),
        // Toplulukları listelemek ve düzenlemek için gerekli widget'lar buraya eklenecek
      ],
    );
  }

  Widget _buildProjectOrAwardSection(
      List<ProjectOrAwardModel>? projectsAndAwards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Projeler ve Ödüller',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.0),
        // Projeleri ve ödülleri listelemek ve düzenlemek için gerekli widget'lar buraya eklenecek
      ],
    );
  }

  Widget _buildForeignLanguageSection(
      List<ForeignLanguageModel>? foreignLanguages) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Yabancı Diller',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.0),
        // Yabancı dilleri listelemek ve düzenlemek için gerekli widget'lar buraya eklenecek
      ],
    );
  }

  Widget _buildMediaAccountSection(MediaAccountModel? mediaAccounts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Medya Hesapları',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.0),
        // Medya hesaplarını listelemek ve düzenlemek için gerekli widget'lar buraya eklenecek
      ],
    );
  }
}
