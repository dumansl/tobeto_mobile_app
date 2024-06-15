// ui/user_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tobeto_mobile_app/blocs/user_bloc/user_bloc.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_event.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_state.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(FetchUserData()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kullanıcı Bilgileri'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserLoaded) {
              final user = state.user;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    ListTile(
                      title: Text('Hakkımda'),
                      subtitle: Text(user.aboutMe ?? 'Bilinmiyor'),
                    ),
                    ListTile(
                      title: Text('Alan ID'),
                      subtitle: Text(user.areaId?.toString() ?? 'Bilinmiyor'),
                    ),
                    ListTile(
                      title: Text('Doğum Günü'),
                      subtitle: Text(user.birthday ?? 'Bilinmiyor'),
                    ),
                    ListTile(
                      title: Text('Ülke'),
                      subtitle: Text(user.country ?? 'Bilinmiyor'),
                    ),
                    ListTile(
                      title: Text('Engel Durumu'),
                      subtitle: Text(user.disabilityStatus ?? 'Bilinmiyor'),
                    ),
                    ListTile(
                      title: Text('İlçe'),
                      subtitle: Text(user.district ?? 'Bilinmiyor'),
                    ),
                    ListTile(
                      title: Text('E-posta'),
                      subtitle: Text(user.email ?? 'Bilinmiyor'),
                    ),
                    ListTile(
                      title: Text('Ad'),
                      subtitle: Text(user.firstName ?? 'Bilinmiyor'),
                    ),
                    ListTile(
                      title: Text('Cinsiyet'),
                      subtitle: Text(user.gender ?? 'Bilinmiyor'),
                    ),
                    ListTile(
                      title: Text('GitHub Adresi'),
                      subtitle: Text(user.githubAddress ?? 'Bilinmiyor'),
                    ),
                    ListTile(
                      title: Text('Soyad'),
                      subtitle: Text(user.lastName ?? 'Bilinmiyor'),
                    ),
                    ListTile(
                      title: Text('Askerlik Durumu'),
                      subtitle: Text(user.militaryStatus ?? 'Bilinmiyor'),
                    ),
                    ListTile(
                      title: Text('Mahalle ve Sokak'),
                      subtitle:
                          Text(user.neighborhoodAndStreet ?? 'Bilinmiyor'),
                    ),
                    ListTile(
                      title: Text('Telefon Numarası'),
                      subtitle: Text(user.phoneNumber ?? 'Bilinmiyor'),
                    ),
                    ListTile(
                      title: Text('İl'),
                      subtitle: Text(user.province ?? 'Bilinmiyor'),
                    ),
                  ],
                ),
              );
            } else if (state is UserError) {
              return Center(child: Text('Hata: ${state.message}'));
            } else {
              return Center(child: Text('Veri yükleniyor...'));
            }
          },
        ),
      ),
    );
  }
}
