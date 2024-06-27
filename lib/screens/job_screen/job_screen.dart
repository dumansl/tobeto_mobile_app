import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_mobile_app/blocs/job_bloc/job_bloc.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import 'job_widgets/job_card.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          // Kullanıcı giriş yapmamışsa giriş ekranına yönlendirin
          Navigator.of(context).pushReplacementNamed('/login');
          return JobBloc();
        } else {
          // Kullanıcı kimliği ile JobBloc'u başlatın
          return JobBloc()..add(LoadJobs(user.uid));
        }
      },
      child: Scaffold(
        appBar: FixedAppbar(
          title: Text('İş Süreçlerim',
              style: TobetoTextStyle.poppins(context).subHeadlinePurpleBold28),
        ),
        body: BlocBuilder<JobBloc, JobState>(
          builder: (context, state) {
            if (state is JobLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is JobLoaded) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(ScreenPadding.padding8px),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ToggleButtons(
                        borderColor: Colors.transparent,
                        fillColor: TobetoColor.purple,
                        borderWidth: 2,
                        selectedBorderColor: Colors.transparent,
                        selectedColor: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        isSelected: [
                          state.selectedIndex == 0,
                          state.selectedIndex == 1
                        ],
                        onPressed: (index) {
                          context.read<JobBloc>().add(ToggleTab(index));
                        },
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text('Başvurularım',
                                style: TextStyle(fontFamily: 'Poppins')),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text('Mülakatlarım',
                                style: TextStyle(fontFamily: 'Poppins')),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: state.jobs.where((job) {
                        if (state.selectedIndex == 1) {
                          return job.interview == true;
                        }
                        return true;
                      }).map((job) {
                        return JobCard(job: job);
                      }).toList(),
                    ),
                  ),
                ],
              );
            } else if (state is JobError) {
              return Center(child: Text(state.message));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
