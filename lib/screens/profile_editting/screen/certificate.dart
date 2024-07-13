import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/certificate_bloc/certificate_bloc.dart';
import 'package:tobeto_mobile_app/blocs/certificate_bloc/certificate_event.dart';
import 'package:tobeto_mobile_app/blocs/certificate_bloc/certificate_state.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_column.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_date_input.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_elevated_button.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_mini_card.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_textfield.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/custom_title.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/widgets/input_text.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/snack_bar.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({super.key});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  final TextEditingController certificatesNameController =
      TextEditingController();
  final TextEditingController certificateDateController =
      TextEditingController();

  void _clearControllers() {
    certificatesNameController.clear();
    certificateDateController.clear();
  }

  bool _areControllersValid() {
    return certificatesNameController.text.isNotEmpty &&
        certificateDateController.text.isNotEmpty;
  }

  void _addClubCominities() {
    final certificate = {
      'certificatesName': certificatesNameController.text,
      'certificateDate': certificateDateController.text,
    };
    context.read<CertificateBloc>().add(AddCertificate(certificate));
    _clearControllers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CertificateBloc, CertificateState>(
      listener: (context, state) {
        if (!state.isLoading && state.error != null) {
          snackBar(context, "İşleminiz başarısız: ${state.error}");
        } else if (!state.isLoading && state.error == null) {
          snackBar(context, "İşleminiz başarılı!",
              bgColor: TobetoColor.state.success);
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          children: [
            CustomTitle(title: TobetoText.profileMyCertificate),
            InputText(
              child: CustomTextField(
                title: TobetoText.profileEditCertificatesName,
                controller: certificatesNameController,
              ),
            ),
            InputText(
              child: CustomDateInput(
                  controller: certificateDateController,
                  labelText: TobetoText.profileEditCertificatesDate),
            ),
            CustomElevatedButton(
              onPressed: () {
                if (_areControllersValid()) {
                  _addClubCominities();
                }
              },
            ),
            if (state.certificate.isEmpty)
              CustomColumn(
                title: TobetoText.emptyCertificate,
              )
            else
              ...state.certificate.map((certificate) {
                return InputText(
                    child: CustomMiniCard(
                  onpressed: () {
                    context
                        .read<CertificateBloc>()
                        .add(RemoveCertificate(certificate));
                  },
                  title: certificate['certificatesName'],
                  content: certificate['certificateDate'],
                ));
              })
          ],
        );
      },
    );
  }
}
