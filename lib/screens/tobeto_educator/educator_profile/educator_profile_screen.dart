import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tobeto_mobile_app/blocs/export_bloc.dart';
import 'package:tobeto_mobile_app/blocs/profile_photo_bloc/profile_photo_state.dart';
import 'package:tobeto_mobile_app/blocs/user_bloc/user_state.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/screen/personal_information.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_date_input.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_dropdown_input.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/phone_textfield.dart';
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
                            : const AssetImage(ImagePath.defaultProfilePhoto) as ImageProvider,
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
                    context.read<ProfilePhotoBloc>().add(UpdateProfilePhoto(_selectedImage!));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: TobetoColor.purple),
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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              InputText(
                  child: CustomTextField(
                title: TobetoText.profileEditName,
                controller: firstNameController,
              )),
              InputText(
                  child: CustomTextField(
                title: TobetoText.profileEditSurname,
                controller: lastNameController,
              )),
              InputText(
                  child: CustomDateInput(controller: birthDateController, labelText: TobetoText.profileEditBirthday)),
              InputText(
                  child: CustomTextField(
                title: TobetoText.profileEditEmail,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                readOnly: true, // E-posta alanını yalnızca okunabilir yapıyoruz.
              )),
              InputText(
                  child: PhoneTextField(
                controller: phoneNumberController,
              )),
              InputText(
                child: CustomDropDownInput(
                  onChanged: (newValue) {
                    genderController.text = newValue ?? genderController.text;
                  },
                  items: TobetoText.genderStatu
                      .map((label) => DropdownMenuItem(
                            value: label,
                            child: Text(label),
                          ))
                      .toList(),
                  title: genderController.text.isNotEmpty ? genderController.text : TobetoText.profileEditGender,
                  controller: genderController,
                  labelText: TobetoText.profileEditGender,
                ),
              ),
              InputText(
                  child: CustomDropDownInput(
                onChanged: (newValue) {
                  militaryStatuController.text = newValue ?? militaryStatuController.text;
                },
                items: TobetoText.militaryStatu
                    .map((label) => DropdownMenuItem(
                          value: label,
                          child: Text(label),
                        ))
                    .toList(),
                title: militaryStatuController.text.isNotEmpty
                    ? militaryStatuController.text
                    : TobetoText.profileEditMilitaryStuation,
                controller: militaryStatuController,
                labelText: TobetoText.profileEditMilitaryStuation,
              )),
              InputText(
                  child: CustomDropDownInput(
                onChanged: (newValue) {
                  disabledStatuController.text = newValue ?? disabledStatuController.text;
                },
                items: TobetoText.disableStatu
                    .map((label) => DropdownMenuItem(
                          value: label,
                          child: Text(label),
                        ))
                    .toList(),
                title: disabledStatuController.text.isNotEmpty
                    ? disabledStatuController.text
                    : TobetoText.profileEditDisableStuation,
                controller: disabledStatuController,
                labelText: TobetoText.profileEditDisableStuation,
              )),
              CustomElevatedButton(
                text: TobetoText.profileEditSaveButton,
                onPressed: () {
                  context.read<UserBloc>().add(UpdateUserData());
                },
              ),
            ],
          ),
        );
      } else if (state is UserError) {
        return Center(child: Text('Error: ${state.message}'));
      } else {
        return const Center(child: Text('Bir hata oluştu.'));
      }
    });
  }
}
