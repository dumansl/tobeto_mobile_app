import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/application_bloc/application_bloc.dart';
import 'package:tobeto_mobile_app/model/application_model.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApplicationScreen extends StatefulWidget {
  const ApplicationScreen({super.key});

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  late ApplicationBloc _applicationBloc;
  late User currentUser;
  final String _errorMessage = 'Exception: Failed to get application ID: Exception: No applications found';

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser!;
    _applicationBloc = BlocProvider.of<ApplicationBloc>(context);
    _loadApplicationData();
  }

  void _loadApplicationData() {
    _applicationBloc.add(const LoadApplication());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FixedAppbar(
        title: Text(TobetoText.mainCard1, style: TobetoTextStyle.poppins(context).subHeadlinePurpleBold28),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<ApplicationBloc, ApplicationState>(
          builder: (context, state) {
            if (state is ApplicationInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ApplicationLoaded) {
              return _buildApplicationContent(context, state.application);
            } else if (state is ApplicationError) {
              if (state.message == _errorMessage) {
                return _emptyApplication();
              } else {
                return Center(child: Text(state.message));
              }
            } else {
              return Center(child: Text(TobetoText.applicationError));
            }
          },
        ),
      ),
    );
  }

  Widget _emptyApplication() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: ScreenUtil.getHeight(context) * 0.4,
            width: ScreenUtil.getHeight(context) * 0.4,
            child: Image.asset(ImagePath.notFound)),
        Text(
          TobetoText.applicationEmpty,
          style: TobetoTextStyle.poppins(context).captionPurpleNormal18,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildApplicationContent(BuildContext context, Application application) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final assetImagePath = isDarkMode ? ImagePath.ikLogoLight : ImagePath.ikLogoDart;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inverseSurface,
            borderRadius: BorderRadius.circular(16),
            border: Border(
              left: BorderSide(
                color: TobetoColor.card.darkGreen,
                width: 7,
              ),
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(
                      assetImagePath,
                      width: ScreenUtil.getHeight(context) * 0.13,
                      height: ScreenUtil.getHeight(context) * 0.13,
                    ),
                    SizedBox(width: ScreenPadding.padding16px),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            application.title,
                            style: TobetoTextStyle.poppins(context).bodyBlackBold16,
                          ),
                          SizedBox(height: ScreenPadding.padding8px),
                          Text(
                            application.description,
                            style: TobetoTextStyle.poppins(context).captionMediumBlack16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 11,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: TobetoColor.card.darkGreen,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  width: 120,
                  child: Text(
                    application.status,
                    style:
                        TobetoTextStyle.poppins(context).captionBlackNormal12.copyWith(color: TobetoColor.card.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
