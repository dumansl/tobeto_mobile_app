import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/club_cominities_bloc/club_cominities_bloc.dart';
import 'package:tobeto_mobile_app/blocs/club_cominities_bloc/club_cominities_event.dart';
import 'package:tobeto_mobile_app/blocs/club_cominities_bloc/club_cominities_state.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_column.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_mini_card.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class ClubCominities extends StatefulWidget {
  const ClubCominities({super.key});

  @override
  State<ClubCominities> createState() => _ClubCominitiesState();
}

class _ClubCominitiesState extends State<ClubCominities> {
  final TextEditingController communityNameController = TextEditingController();
  final TextEditingController communityTitleController = TextEditingController();

  void _clearControllers() {
    communityNameController.clear();
    communityTitleController.clear();
  }

  bool _areControllersValid() {
    return communityNameController.text.isNotEmpty && communityTitleController.text.isNotEmpty;
  }

  void _addClubCominities() {
    final clubCominities = {
      'communityName': communityNameController.text,
      'communityTitle': communityTitleController.text,
    };
    context.read<ClubCominitiesBloc>().add(AddClubCominities(clubCominities));
    _clearControllers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClubCominitiesBloc, ClubCominitiesState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.error != null) {
        return Center(child: Text('Error: ${state.error}'));
      }
      return ListView(
        children: [
          InputText(
            child: CustomTextField(
              title: TobetoText.profileEditCommunityName,
              controller: communityNameController,
            ),
          ),
          InputText(
            child: CustomTextField(
              title: TobetoText.profileEditCommunityTitle,
              controller: communityTitleController,
            ),
          ),
          CustomElevatedButton(
            text: "Ekle",
            onPressed: () {
              if (_areControllersValid()) {
                _addClubCominities();
              }
            },
          ),
          if (state.club.isEmpty)
            const CustomColumn(
              title: "Henüz eklediğiniz bir kulüp veya topluluğunuz bulunmamaktadır.",
            )
          else
            ...state.club.map((club) {
              return InputText(
                  child: CustomMiniCard(
                onpressed: () {
                  context.read<ClubCominitiesBloc>().add(RemoveClubCominities(club));
                },
                title: club['communityName'],
                content: club['communityTitle'],
              ));
            })
        ],
      );
    });
  }
}
