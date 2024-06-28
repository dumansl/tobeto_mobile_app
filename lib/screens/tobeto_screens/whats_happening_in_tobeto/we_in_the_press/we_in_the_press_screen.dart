import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/press_bloc.dart/press_bloc.dart';
import 'package:tobeto_mobile_app/blocs/press_bloc.dart/press_state.dart';
import 'package:tobeto_mobile_app/model/press_model.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

import 'press_details_screen.dart';

class WeInThePressScreen extends StatelessWidget {
  const WeInThePressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FixedAppbar(
        title: Text(
          TobetoText.tpressAppBar,
          style: TobetoTextStyle.poppins(context).subHeadlinePurpleBold28,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: EdgeInsets.all(ScreenPadding.padding12px),
        child: BlocBuilder<PressBloc, PressState>(
          builder: (context, state) {
            if (state is PressLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PressLoaded) {
              final pressList = state.press.reversed.toList();
              return ListView.builder(
                itemCount: pressList.length,
                itemBuilder: (context, index) {
                  final press = pressList[index];
                  return _pressCard(
                    context,
                    press: press,
                  );
                },
              );
            } else if (state is PressError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No blog posts available.'));
            }
          },
        ),
      ),
    );
  }

  Widget _pressCard(
    BuildContext context, {
    required PressModel press,
  }) {
    String formattedDate = press.getFormattedDate(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PressDetailsScreen(press: press),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(ScreenPadding.padding12px),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              boxShadow: [
                BoxShadow(
                  color: TobetoColor.card.shadowColor,
                  blurRadius: 4,
                  offset: const Offset(
                    0,
                    2,
                  ),
                )
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(SizeRadius.radius20px),
              ),
              border: Border.all(color: TobetoColor.frame.lightGrey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: ScreenUtil.getHeight(context) * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(SizeRadius.radius20px)),
                    image: DecorationImage(
                      image: NetworkImage(press.imageUrls[0]),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: ScreenPadding.padding8px),
                Text(
                  formattedDate,
                  style: TobetoTextStyle.poppins(context).captionMediumBlack16,
                ),
                SizedBox(height: ScreenPadding.padding8px),
                Text(
                  press.title,
                  style: TobetoTextStyle.poppins(context).captionMediumBlack16,
                ),
                SizedBox(height: ScreenPadding.padding8px),
                Text(
                  "${press.description.substring(0, 160)} . . .",
                  style: TobetoTextStyle.poppins(context).captionBlackLight15,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          SizedBox(height: ScreenPadding.padding16px),
        ],
      ),
    );
  }
}
