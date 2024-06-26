import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class Typography {
  final BuildContext context;
  final TextStyle baseStyle;

  // Black styles
  late TextStyle headlineBlackBold32;
  late TextStyle headlineBlackSemiBold32;
  late TextStyle headlineBlackNormal32;
  late TextStyle headlineBlackLight32;

  late TextStyle subHeadlineBlackBold28;
  late TextStyle subHeadlineBlackSemiBold28;
  late TextStyle subHeadlineBlackNormal28;
  late TextStyle subHeadlineBlackLight28;

  late TextStyle titleBlackBold24;
  late TextStyle titleBlackSemiBold24;
  late TextStyle titleBlackNormal24;
  late TextStyle titleBlackLight24;

  late TextStyle subtitleBlackBold20;
  late TextStyle subtitleBlackSemiBold20;
  late TextStyle subtitleBlackNormal20;
  late TextStyle subtitleBlackLight20;

  late TextStyle bodyBlackBold16;
  late TextStyle themebodyBlackBold16;
  late TextStyle bodyBlackSemiBold16;
  late TextStyle bodyBlackNormal16;
  late TextStyle bodyBlackLight16;

  late TextStyle captionBlackBold15;
  late TextStyle captionBlackSemiBold15;
  late TextStyle captionBlackNormal15;
  late TextStyle captionBlackLight15;

  late TextStyle captionBlackNormal14;

  // White styles
  late TextStyle headlineWhiteBold32;
  late TextStyle headlineWhiteSemiBold32;
  late TextStyle headlineWhiteNormal32;
  late TextStyle headlineWhiteLight32;

  late TextStyle subHeadlineWhiteBold28;
  late TextStyle subHeadlineWhiteSemiBold28;
  late TextStyle subHeadlineWhiteNormal28;
  late TextStyle subHeadlineWhiteLight28;

  late TextStyle titleWhiteBold24;
  late TextStyle titleWhiteSemiBold24;
  late TextStyle titleWhiteNormal24;
  late TextStyle titleWhiteLight24;

  late TextStyle subtitleWhiteBold20;
  late TextStyle subtitleWhiteSemiBold20;
  late TextStyle subtitleWhiteNormal20;
  late TextStyle subtitleWhiteLight20;

  late TextStyle bodyWhiteBold16;
  late TextStyle bodyWhiteSemiBold16;
  late TextStyle bodyWhiteNormal16;
  late TextStyle bodyWhiteLight16;

  late TextStyle captionWhiteBold15;
  late TextStyle captionWhiteSemiBold15;
  late TextStyle captionWhiteNormal15;
  late TextStyle captionWhiteLight15;

  late TextStyle captionWhiteNormal14;
  late TextStyle captionWhiteSemiBold14;
  late TextStyle captionWhiteSemiBold8;

  // Purple styles
  late TextStyle headlinePurpleBold32;
  late TextStyle headlinePurpleSemiBold32;
  late TextStyle headlinePurpleNormal32;
  late TextStyle headlinePurpleLight32;

  late TextStyle subHeadlinePurpleBold28;
  late TextStyle subHeadlinePurpleSemiBold28;
  late TextStyle subHeadlinePurpleNormal28;
  late TextStyle subHeadlinePurpleLight28;

  late TextStyle titlePurpleBold24;
  late TextStyle titlePurpleSemiBold24;
  late TextStyle titlePurpleNormal24;
  late TextStyle titlePurpleLight24;

  late TextStyle subtitlePurpleBold20;
  late TextStyle subtitlePurpleSemiBold20;
  late TextStyle subtitlePurpleNormal20;
  late TextStyle subtitlePurpleLight20;

  late TextStyle bodyPurpleBold16;
  late TextStyle bodyPurpleSemiBold16;
  late TextStyle bodyPurpleNormal16;
  late TextStyle bodyPurpleLight16;

  late TextStyle captionPurpleBold15;
  late TextStyle captionPurpleSemiBold15;
  late TextStyle captionPurpleNormal15;
  late TextStyle captionPurpleLight15;

  // Gray Dark styles
  late TextStyle headlineGrayDarkBold32;
  late TextStyle headlineGrayDarkSemiBold32;
  late TextStyle headlineGrayDarkNormal32;
  late TextStyle headlineGrayDarkLight32;

  late TextStyle subHeadlineGrayDarkBold28;
  late TextStyle subHeadlineGrayDarkSemiBold28;
  late TextStyle subHeadlineGrayDarkNormal28;
  late TextStyle subHeadlineGrayDarkLight28;

  late TextStyle titleGrayDarkBold24;
  late TextStyle titleGrayDarkSemiBold24;
  late TextStyle titleGrayDarkNormal24;
  late TextStyle titleGrayDarkLight24;

  late TextStyle subtitleGrayDarkBold20;
  late TextStyle subtitleGrayDarkSemiBold20;
  late TextStyle subtitleGrayDarkNormal20;
  late TextStyle subtitleGrayDarkLight20;

  late TextStyle bodyGrayDarkBold16;
  late TextStyle bodyGrayDarkSemiBold16;
  late TextStyle bodyGrayDarkNormal16;
  late TextStyle bodyGrayDarkLight16;

  late TextStyle captionGrayDarkBold15;
  late TextStyle captionGrayDarkSemiBold15;
  late TextStyle captionGrayDarkNormal15;
  late TextStyle captionGrayDarkLight15;

  // Gray Light styles
  late TextStyle headlineGrayLightBold32;
  late TextStyle headlineGrayLightSemiBold32;
  late TextStyle headlineGrayLightNormal32;
  late TextStyle headlineGrayLightLight32;

  late TextStyle subHeadlineGrayLightBold28;
  late TextStyle subHeadlineGrayLightSemiBold28;
  late TextStyle subHeadlineGrayLightNormal28;
  late TextStyle subHeadlineGrayLightLight28;

  late TextStyle titleGrayLightBold24;
  late TextStyle titleGrayLightSemiBold24;
  late TextStyle titleGrayLightNormal24;
  late TextStyle titleGrayLightLight24;

  late TextStyle subtitleGrayLightBold20;
  late TextStyle subtitleGrayLightSemiBold20;
  late TextStyle subtitleGrayLightNormal20;
  late TextStyle subtitleGrayLightLight20;

  late TextStyle bodyGrayLightBold16;
  late TextStyle bodyGrayLightSemiBold16;
  late TextStyle bodyGrayLightNormal16;
  late TextStyle bodyGrayLightLight16;

  late TextStyle captionGrayLightBold15;
  late TextStyle captionGrayLightSemiBold15;
  late TextStyle captionGrayLightNormal15;
  late TextStyle captionGrayLightLight15;

  // Gray Medium styles
  late TextStyle headlineGrayMediumBold32;
  late TextStyle headlineGrayMediumSemiBold32;
  late TextStyle headlineGrayMediumNormal32;
  late TextStyle headlineGrayMediumLight32;

  late TextStyle subHeadlineGrayMediumBold28;
  late TextStyle subHeadlineGrayMediumSemiBold28;
  late TextStyle subHeadlineGrayMediumNormal28;
  late TextStyle subHeadlineGrayMediumLight28;

  late TextStyle titleGrayMediumBold24;
  late TextStyle titleGrayMediumSemiBold24;
  late TextStyle titleGrayMediumNormal24;
  late TextStyle titleGrayMediumLight24;

  late TextStyle subtitleGrayMediumBold20;
  late TextStyle subtitleGrayMediumSemiBold20;
  late TextStyle subtitleGrayMediumNormal20;
  late TextStyle subtitleGrayMediumLight20;

  late TextStyle bodyGrayMediumBold16;
  late TextStyle bodyGrayMediumSemiBold16;
  late TextStyle bodyGrayMediumNormal16;
  late TextStyle bodyGrayMediumLight16;

  late TextStyle captionGrayMediumBold15;
  late TextStyle captionGrayMediumSemiBold15;
  late TextStyle captionGrayMediumNormal15;
  late TextStyle captionGrayMediumLight15;

  late TextStyle captionPurpleThin12;
  late TextStyle captionPurpleBold12;
  late TextStyle captionPurpleNormal12;

  late TextStyle captionWhiteThin12;
  late TextStyle captionWhiteBold12;
  late TextStyle captionWhiteNormal12;

  late TextStyle captionBlackThin12;
  late TextStyle captionBlackBold12;
  late TextStyle captionBlackNormal12;

  late TextStyle captionGrayThin12;
  late TextStyle captionGrayBold12;
  late TextStyle captionGrayNormal12;
  late TextStyle lightcaptionGrayNormal12;

  late TextStyle captionLightGrayThin12;
  late TextStyle captionLightGrayBold12;
  late TextStyle captionLightGrayNormal12;

  late TextStyle captionPurpleThin18;
  late TextStyle captionPurpleBold18;
  late TextStyle captionPurpleNormal18;

  late TextStyle captionWhiteThin18;
  late TextStyle captionWhiteBold18;
  late TextStyle captionWhiteNormal18;

  late TextStyle captionBlackThin18;
  late TextStyle captionBlackBold18;
  late TextStyle captionBlackNormal18;

  late TextStyle captionGrayThin18;
  late TextStyle captionGrayBold18;
  late TextStyle captionGrayNormal18;

  late TextStyle captionLightGrayThin18;
  late TextStyle captionLightGrayBold18;
  late TextStyle captionLightGrayNormal18;

  late TextStyle captionPurpleThin24;
  late TextStyle captionPurpleBold24;
  late TextStyle captionPurpleNormal24;

  late TextStyle captionWhiteThin24;
  late TextStyle captionWhiteBold24;
  late TextStyle captionWhiteNormal24;

  late TextStyle captionBlackThin24;
  late TextStyle captionBlackBold24;
  late TextStyle captionBlackNormal24;

  late TextStyle captionGrayThin24;
  late TextStyle captionGrayBold24;
  late TextStyle captionGrayNormal24;

  late TextStyle captionLightGrayThin24;
  late TextStyle captionLightGrayBold24;
  late TextStyle captionLightGrayNormal24;

  late TextStyle captionPurpleThin30;
  late TextStyle captionPurpleBold30;
  late TextStyle captionPurpleNormal30;

  late TextStyle captionWhiteThin30;
  late TextStyle captionWhiteBold30;
  late TextStyle captionWhiteNormal30;

  late TextStyle captionBlackThin30;
  late TextStyle captionBlackBold30;
  late TextStyle captionBlackNormal30;

  late TextStyle captionGrayThin30;
  late TextStyle captionGrayBold30;
  late TextStyle captionGrayNormal30;

  late TextStyle captionLightGrayThin30;
  late TextStyle captionLightGrayBold30;
  late TextStyle captionLightGrayNormal30;
  late TextStyle captionMediumPurple12;
  late TextStyle captionMediumPurple14;
  late TextStyle captionMediumPurple16;
  late TextStyle captionMediumPurple18;
  late TextStyle captionMediumPurple20;
  late TextStyle captionMediumPurple22;
  late TextStyle captionMediumPurple24;
  late TextStyle captionMediumPurple26;
  late TextStyle captionMediumPurple28;
  late TextStyle captionMediumPurple30;
  late TextStyle captionMediumPurple32;

  late TextStyle captionMediumDarkGreen12;
  late TextStyle captionMediumDarkGreen14;
  late TextStyle captionMediumDarkGreen16;
  late TextStyle captionMediumDarkGreen18;
  late TextStyle captionMediumDarkGreen20;
  late TextStyle captionMediumDarkGreen22;
  late TextStyle captionMediumDarkGreen24;
  late TextStyle captionMediumDarkGreen26;
  late TextStyle captionMediumDarkGreen28;
  late TextStyle captionMediumDarkGreen30;
  late TextStyle captionMediumDarkGreen32;

  late TextStyle captionMediumWhite12;
  late TextStyle captionMediumWhite14;
  late TextStyle captionMediumWhite16;
  late TextStyle captionMediumWhite18;
  late TextStyle captionMediumWhite20;
  late TextStyle captionMediumWhite22;
  late TextStyle captionMediumWhite24;
  late TextStyle captionMediumWhite26;
  late TextStyle captionMediumWhite28;
  late TextStyle captionMediumWhite30;
  late TextStyle captionMediumWhite32;

  late TextStyle captionMediumBlack12;
  late TextStyle captionMediumBlack14;
  late TextStyle captionMediumBlack16;
  late TextStyle captionMediumBlack18;
  late TextStyle captionMediumBlack20;
  late TextStyle captionMediumBlack22;
  late TextStyle captionMediumBlack24;
  late TextStyle captionMediumBlack26;
  late TextStyle captionMediumBlack28;
  late TextStyle captionMediumBlack30;
  late TextStyle captionMediumBlack32;

  late TextStyle captionMediumGreen12;
  late TextStyle captionMediumGreen14;
  late TextStyle captionMediumGreen16;
  late TextStyle captionMediumGreen18;
  late TextStyle captionMediumGreen20;
  late TextStyle captionMediumGreen22;
  late TextStyle captionMediumGreen24;
  late TextStyle captionMediumGreen26;
  late TextStyle captionMediumGreen28;
  late TextStyle captionMediumGreen30;
  late TextStyle captionMediumGreen32;

  Typography({required this.context, required this.baseStyle}) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    captionPurpleThin12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: TobetoColor.purple,
    );
    captionMediumPurple12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Colors.purple,
    );
    captionMediumPurple14 = baseStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.purple,
    );
    captionMediumPurple16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.purple,
    );
    captionMediumPurple18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.purple,
    );
    captionMediumPurple20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.purple,
    );
    captionMediumPurple22 = baseStyle.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: Colors.purple,
    );
    captionMediumPurple24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Colors.purple,
    );
    captionMediumPurple26 = baseStyle.copyWith(
      fontSize: 26,
      fontWeight: FontWeight.w500,
      color: Colors.purple,
    );
    captionMediumPurple28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: Colors.purple,
    );
    captionMediumPurple30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w500,
      color: Colors.purple,
    );
    captionMediumPurple32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: Colors.purple,
    );
    captionMediumDarkGreen12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.darkGrey,
    );
    captionMediumDarkGreen14 = baseStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.darkGrey,
    );
    captionMediumDarkGreen16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.darkGrey,
    );
    captionMediumDarkGreen18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.darkGrey,
    );
    captionMediumDarkGreen20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.darkGrey,
    );
    captionMediumDarkGreen22 = baseStyle.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.darkGrey,
    );
    captionMediumDarkGreen24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.darkGrey,
    );
    captionMediumDarkGreen26 = baseStyle.copyWith(
      fontSize: 26,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.darkGrey,
    );
    captionMediumDarkGreen28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.darkGrey,
    );
    captionMediumDarkGreen30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.darkGrey,
    );
    captionMediumDarkGreen32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.darkGrey,
    );
    captionMediumWhite12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.white,
    );
    captionMediumWhite14 = baseStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.white,
    );
    captionMediumWhite16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.white,
    );
    captionMediumWhite18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.white,
    );
    captionMediumWhite20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.white,
    );
    captionMediumWhite22 = baseStyle.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.white,
    );
    captionMediumWhite24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.white,
    );
    captionMediumWhite26 = baseStyle.copyWith(
      fontSize: 26,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.white,
    );
    captionMediumWhite28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.white,
    );
    captionMediumWhite30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.white,
    );
    captionMediumWhite32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.white,
    );
    captionMediumBlack12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionMediumBlack14 = baseStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionMediumBlack16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionMediumBlack18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionMediumBlack20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionMediumBlack22 = baseStyle.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionMediumBlack24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionMediumBlack26 = baseStyle.copyWith(
      fontSize: 26,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionMediumBlack28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionMediumBlack30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionMediumBlack32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionMediumGreen12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.lightGreen,
    );
    captionMediumGreen14 = baseStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.lightGreen,
    );
    captionMediumGreen16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.lightGreen,
    );
    captionMediumGreen18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.lightGreen,
    );
    captionMediumGreen20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.lightGreen,
    );
    captionMediumGreen22 = baseStyle.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.lightGreen,
    );
    captionMediumGreen24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.lightGreen,
    );
    captionMediumGreen26 = baseStyle.copyWith(
      fontSize: 26,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.lightGreen,
    );
    captionMediumGreen28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.lightGreen,
    );
    captionMediumGreen30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.lightGreen,
    );
    captionMediumGreen32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: TobetoColor.text.lightGreen,
    );
    captionPurpleBold12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: TobetoColor.purple,
    );
    captionPurpleNormal12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: TobetoColor.purple,
    );
    captionWhiteThin12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.white,
    );
    captionWhiteBold12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.white,
    );
    captionWhiteNormal12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.white,
    );
    captionBlackThin12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionBlackBold12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionBlackNormal12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionGrayThin12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionGrayBold12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.surface,
    );
    captionGrayNormal12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    lightcaptionGrayNormal12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
    );

    captionLightGrayThin12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionLightGrayBold12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionLightGrayNormal12 = baseStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onTertiary,
    );
    captionPurpleThin18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w300,
      color: TobetoColor.purple,
    );
    captionPurpleBold18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: TobetoColor.purple,
    );
    captionPurpleNormal18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: TobetoColor.purple,
    );
    captionWhiteThin18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.white,
    );
    captionWhiteBold18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.white,
    );
    captionWhiteNormal18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.white,
    );
    captionBlackThin18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionBlackBold18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionBlackNormal18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionGrayThin18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionGrayBold18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionGrayNormal18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionLightGrayThin18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionLightGrayBold18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionLightGrayNormal18 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionPurpleThin24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w300,
      color: TobetoColor.purple,
    );
    captionPurpleBold24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: TobetoColor.purple,
    );
    captionPurpleNormal24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      color: TobetoColor.purple,
    );
    captionWhiteThin24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.white,
    );
    captionWhiteBold24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.white,
    );
    captionWhiteNormal24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.white,
    );
    captionBlackThin24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionBlackBold24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionBlackNormal24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionGrayThin24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionGrayBold24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionGrayNormal24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionLightGrayThin24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionLightGrayBold24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionLightGrayNormal24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionPurpleThin30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w300,
      color: TobetoColor.purple,
    );
    captionPurpleBold30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: TobetoColor.purple,
    );
    captionPurpleNormal30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.normal,
      color: TobetoColor.purple,
    );
    captionWhiteThin30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.white,
    );
    captionWhiteBold30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.white,
    );
    captionWhiteNormal30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.white,
    );
    captionBlackThin30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionBlackBold30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionBlackNormal30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionGrayThin30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionGrayBold30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionGrayNormal30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionLightGrayThin30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionLightGrayBold30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionLightGrayNormal30 = baseStyle.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    headlineBlackBold32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    headlineGrayMediumBold32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.darkGrey,
    );
    headlineGrayMediumSemiBold32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.darkGrey,
    );
    headlineGrayMediumNormal32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.darkGrey,
    );
    headlineGrayMediumLight32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.darkGrey,
    );
    titleGrayMediumBold24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.darkGrey,
    );
    titleGrayMediumSemiBold24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.darkGrey,
    );
    titleGrayMediumNormal24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.darkGrey,
    );
    titleGrayMediumLight24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.darkGrey,
    );
    subtitleGrayMediumBold20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.darkGrey,
    );
    subtitleGrayMediumSemiBold20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.darkGrey,
    );
    subtitleGrayMediumNormal20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.darkGrey,
    );
    subtitleGrayMediumLight20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.darkGrey,
    );
    captionGrayMediumBold15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.darkGrey,
    );
    captionGrayMediumSemiBold15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.darkGrey,
    );
    captionGrayMediumNormal15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.darkGrey,
    );
    captionGrayMediumLight15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.darkGrey,
    );
    bodyGrayMediumBold16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.darkGrey,
    );
    bodyGrayMediumSemiBold16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.darkGrey,
    );
    bodyGrayMediumNormal16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.darkGrey,
    );
    bodyGrayMediumLight16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.darkGrey,
    );
    headlineBlackSemiBold32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
    headlineBlackNormal32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    headlineBlackLight32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    subHeadlineBlackBold28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    subHeadlineBlackSemiBold28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
    subHeadlineBlackNormal28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    subHeadlineGrayMediumBold28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.darkGrey,
    );
    subHeadlineGrayMediumSemiBold28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.darkGrey,
    );
    subHeadlineGrayMediumNormal28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.darkGrey,
    );
    subHeadlineGrayMediumLight28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.darkGrey,
    );
    subHeadlineBlackLight28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    titleBlackBold24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    titleBlackSemiBold24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
    titleBlackNormal24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    titleBlackLight24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    subtitleBlackBold20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    subtitleBlackSemiBold20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
    subtitleBlackNormal20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    subtitleBlackLight20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    bodyBlackBold16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.black,
    );
    themebodyBlackBold16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    bodyBlackSemiBold16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
    bodyBlackNormal16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    bodyBlackLight16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionBlackBold15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionBlackSemiBold15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionBlackNormal15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionBlackLight15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    headlineWhiteBold32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.white,
    );
    headlineWhiteSemiBold32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.white,
    );
    headlineWhiteNormal32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.white,
    );
    headlineWhiteLight32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.white,
    );
    subHeadlineWhiteBold28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.white,
    );
    subHeadlineWhiteSemiBold28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.white,
    );
    subHeadlineWhiteNormal28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.white,
    );
    subHeadlineWhiteLight28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.white,
    );
    titleWhiteBold24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.white,
    );
    titleWhiteSemiBold24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.white,
    );
    titleWhiteNormal24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.white,
    );
    titleWhiteLight24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.white,
    );
    subtitleWhiteBold20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.white,
    );
    subtitleWhiteSemiBold20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.white,
    );
    subtitleWhiteNormal20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.white,
    );
    subtitleWhiteLight20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.white,
    );
    bodyWhiteBold16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.white,
    );
    bodyWhiteSemiBold16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.white,
    );
    bodyWhiteNormal16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.white,
    );
    bodyWhiteLight16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.white,
    );
    captionWhiteBold15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.white,
    );
    captionWhiteSemiBold15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.white,
    );
    captionWhiteNormal15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.white,
    );
    captionWhiteLight15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.white,
    );
    captionWhiteNormal14 = baseStyle.copyWith(
      fontSize: 14,
      color: TobetoColor.text.white,
    );
    captionWhiteSemiBold14 = baseStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.white,
    );
    captionWhiteSemiBold8 = baseStyle.copyWith(
      fontSize: 8,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.white,
    );
    headlinePurpleBold32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: TobetoColor.purple,
    );
    headlinePurpleSemiBold32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: TobetoColor.purple,
    );
    headlinePurpleNormal32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.normal,
      color: TobetoColor.purple,
    );
    headlinePurpleLight32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w300,
      color: TobetoColor.purple,
    );
    subHeadlinePurpleBold28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: TobetoColor.purple,
    );
    subHeadlinePurpleSemiBold28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: TobetoColor.purple,
    );
    subHeadlinePurpleNormal28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.normal,
      color: TobetoColor.purple,
    );
    subHeadlinePurpleLight28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w300,
      color: TobetoColor.purple,
    );
    titlePurpleBold24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: TobetoColor.purple,
    );
    titlePurpleSemiBold24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: TobetoColor.purple,
    );
    titlePurpleNormal24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      color: TobetoColor.purple,
    );
    titlePurpleLight24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w300,
      color: TobetoColor.purple,
    );
    subtitlePurpleBold20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: TobetoColor.purple,
    );
    subtitlePurpleSemiBold20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: TobetoColor.purple,
    );
    subtitlePurpleNormal20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: TobetoColor.purple,
    );
    subtitlePurpleLight20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w300,
      color: TobetoColor.purple,
    );
    bodyPurpleBold16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: TobetoColor.purple,
    );
    bodyPurpleSemiBold16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: TobetoColor.purple,
    );
    bodyPurpleNormal16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: TobetoColor.purple,
    );
    bodyPurpleLight16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: TobetoColor.purple,
    );
    captionPurpleBold15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: TobetoColor.purple,
    );
    captionPurpleSemiBold15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: TobetoColor.purple,
    );
    captionPurpleNormal15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: TobetoColor.purple,
    );
    captionPurpleLight15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      color: TobetoColor.purple,
    );
    headlineGrayDarkBold32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.darkGrey,
    );
    headlineGrayDarkSemiBold32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.darkGrey,
    );
    headlineGrayDarkNormal32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.darkGrey,
    );
    headlineGrayDarkLight32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.darkGrey,
    );
    subHeadlineGrayDarkBold28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.darkGrey,
    );
    subHeadlineGrayDarkSemiBold28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.darkGrey,
    );
    subHeadlineGrayDarkNormal28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.darkGrey,
    );
    subHeadlineGrayDarkLight28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.darkGrey,
    );
    titleGrayDarkBold24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.darkGrey,
    );
    titleGrayDarkSemiBold24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.darkGrey,
    );
    titleGrayDarkNormal24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.darkGrey,
    );
    titleGrayDarkLight24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.darkGrey,
    );
    subtitleGrayDarkBold20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.darkGrey,
    );
    subtitleGrayDarkSemiBold20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.darkGrey,
    );
    subtitleGrayDarkNormal20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.darkGrey,
    );
    subtitleGrayDarkLight20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.darkGrey,
    );
    bodyGrayDarkBold16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.darkGrey,
    );
    bodyGrayDarkSemiBold16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.darkGrey,
    );
    bodyGrayDarkNormal16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.darkGrey,
    );
    bodyGrayDarkLight16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.darkGrey,
    );
    captionGrayDarkBold15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: TobetoColor.text.darkGrey,
    );
    captionGrayDarkSemiBold15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: TobetoColor.text.darkGrey,
    );
    captionGrayDarkNormal15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.darkGrey,
    );
    captionGrayDarkLight15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      color: TobetoColor.text.darkGrey,
    );
    headlineGrayLightBold32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    headlineGrayLightSemiBold32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
    headlineGrayLightNormal32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    headlineGrayLightLight32 = baseStyle.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    subHeadlineGrayLightBold28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    subHeadlineGrayLightSemiBold28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
    subHeadlineGrayLightNormal28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    subHeadlineGrayLightLight28 = baseStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    titleGrayLightBold24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    titleGrayLightSemiBold24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
    titleGrayLightNormal24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    titleGrayLightLight24 = baseStyle.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    subtitleGrayLightBold20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    subtitleGrayLightSemiBold20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
    subtitleGrayLightNormal20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).colorScheme.onSurface,
    );
    subtitleGrayLightLight20 = baseStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    bodyGrayLightBold16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    bodyGrayLightSemiBold16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
    bodyGrayLightNormal16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: TobetoColor.text.darkGrey,
    );
    bodyGrayLightLight16 = baseStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionGrayLightBold15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionGrayLightSemiBold15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionGrayLightNormal15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: colorScheme.onSurface,
    );
    captionGrayLightLight15 = baseStyle.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onSurface,
    );
    captionBlackNormal14 = baseStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
}

class TobetoTextStyle {
  static Typography poppins(BuildContext context) => Typography(context: context, baseStyle: GoogleFonts.poppins());

  static Typography inter(BuildContext context) => Typography(context: context, baseStyle: GoogleFonts.inter());
}
