import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/application_bloc/application_bloc.dart';
import 'package:tobeto_mobile_app/model/application_model.dart';
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

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser!;
    _applicationBloc = BlocProvider.of<ApplicationBloc>(context);
    _loadApplicationData();
  }

  void _loadApplicationData() {
    // ApplicationBloc'a LoadApplication event'i gönder
    _applicationBloc.add(const LoadApplication());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TobetoText.mainCard1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('An unknown error occurred'));
            }
          },
        ),
      ),
    );
  }

  Widget _buildApplicationContent(
      BuildContext context, Application application) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: TobetoColor.card.cream,
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
                      ImagePath.ikLogoDart,
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            application.title,
                            style: TobetoTextStyle.poppins(context)
                                .bodyBlackBold16,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            application.description,
                            style: TobetoTextStyle.poppins(context)
                                .bodyBlackLight16,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: const BoxDecoration(
                    color: Color(0xFF076B34),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  width: 120,
                  child: Text(
                    application.status,
                    style: TobetoTextStyle.poppins(context)
                        .captionBlackNormal12
                        .copyWith(color: TobetoColor.card.white),
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
