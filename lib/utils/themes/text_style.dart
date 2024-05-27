import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class Typography {
  final TextStyle baseStyle;

  // Black styles
  final TextStyle headlineBlackBold32;
  final TextStyle headlineBlackSemiBold32;
  final TextStyle headlineBlackNormal32;
  final TextStyle headlineBlackLight32;

  final TextStyle subHeadlineBlackBold28;
  final TextStyle subHeadlineBlackSemiBold28;
  final TextStyle subHeadlineBlackNormal28;
  final TextStyle subHeadlineBlackLight28;

  final TextStyle titleBlackBold24;
  final TextStyle titleBlackSemiBold24;
  final TextStyle titleBlackNormal24;
  final TextStyle titleBlackLight24;

  final TextStyle subtitleBlackBold20;
  final TextStyle subtitleBlackSemiBold20;
  final TextStyle subtitleBlackNormal20;
  final TextStyle subtitleBlackLight20;

  final TextStyle bodyBlackBold16;
  final TextStyle bodyBlackSemiBold16;
  final TextStyle bodyBlackNormal16;
  final TextStyle bodyBlackLight16;

  final TextStyle captionBlackBold15;
  final TextStyle captionBlackSemiBold15;
  final TextStyle captionBlackNormal15;
  final TextStyle captionBlackLight15;

  // White styles
  final TextStyle headlineWhiteBold32;
  final TextStyle headlineWhiteSemiBold32;
  final TextStyle headlineWhiteNormal32;
  final TextStyle headlineWhiteLight32;

  final TextStyle subHeadlineWhiteBold28;
  final TextStyle subHeadlineWhiteSemiBold28;
  final TextStyle subHeadlineWhiteNormal28;
  final TextStyle subHeadlineWhiteLight28;

  final TextStyle titleWhiteBold24;
  final TextStyle titleWhiteSemiBold24;
  final TextStyle titleWhiteNormal24;
  final TextStyle titleWhiteLight24;

  final TextStyle subtitleWhiteBold20;
  final TextStyle subtitleWhiteSemiBold20;
  final TextStyle subtitleWhiteNormal20;
  final TextStyle subtitleWhiteLight20;

  final TextStyle bodyWhiteBold16;
  final TextStyle bodyWhiteSemiBold16;
  final TextStyle bodyWhiteNormal16;
  final TextStyle bodyWhiteLight16;

  final TextStyle captionWhiteBold15;
  final TextStyle captionWhiteSemiBold15;
  final TextStyle captionWhiteNormal15;
  final TextStyle captionWhiteLight15;

  // Purple styles
  final TextStyle headlinePurpleBold32;
  final TextStyle headlinePurpleSemiBold32;
  final TextStyle headlinePurpleNormal32;
  final TextStyle headlinePurpleLight32;

  final TextStyle subHeadlinePurpleBold28;
  final TextStyle subHeadlinePurpleSemiBold28;
  final TextStyle subHeadlinePurpleNormal28;
  final TextStyle subHeadlinePurpleLight28;

  final TextStyle titlePurpleBold24;
  final TextStyle titlePurpleSemiBold24;
  final TextStyle titlePurpleNormal24;
  final TextStyle titlePurpleLight24;

  final TextStyle subtitlePurpleBold20;
  final TextStyle subtitlePurpleSemiBold20;
  final TextStyle subtitlePurpleNormal20;
  final TextStyle subtitlePurpleLight20;

  final TextStyle bodyPurpleBold16;
  final TextStyle bodyPurpleSemiBold16;
  final TextStyle bodyPurpleNormal16;
  final TextStyle bodyPurpleLight16;

  final TextStyle captionPurpleBold15;
  final TextStyle captionPurpleSemiBold15;
  final TextStyle captionPurpleNormal15;
  final TextStyle captionPurpleLight15;

  // Gray Dark styles
  final TextStyle headlineGrayDarkBold32;
  final TextStyle headlineGrayDarkSemiBold32;
  final TextStyle headlineGrayDarkNormal32;
  final TextStyle headlineGrayDarkLight32;

  final TextStyle subHeadlineGrayDarkBold28;
  final TextStyle subHeadlineGrayDarkSemiBold28;
  final TextStyle subHeadlineGrayDarkNormal28;
  final TextStyle subHeadlineGrayDarkLight28;

  final TextStyle titleGrayDarkBold24;
  final TextStyle titleGrayDarkSemiBold24;
  final TextStyle titleGrayDarkNormal24;
  final TextStyle titleGrayDarkLight24;

  final TextStyle subtitleGrayDarkBold20;
  final TextStyle subtitleGrayDarkSemiBold20;
  final TextStyle subtitleGrayDarkNormal20;
  final TextStyle subtitleGrayDarkLight20;

  final TextStyle bodyGrayDarkBold16;
  final TextStyle bodyGrayDarkSemiBold16;
  final TextStyle bodyGrayDarkNormal16;
  final TextStyle bodyGrayDarkLight16;

  final TextStyle captionGrayDarkBold15;
  final TextStyle captionGrayDarkSemiBold15;
  final TextStyle captionGrayDarkNormal15;
  final TextStyle captionGrayDarkLight15;

  // Gray Light styles
  final TextStyle headlineGrayLightBold32;
  final TextStyle headlineGrayLightSemiBold32;
  final TextStyle headlineGrayLightNormal32;
  final TextStyle headlineGrayLightLight32;

  final TextStyle subHeadlineGrayLightBold28;
  final TextStyle subHeadlineGrayLightSemiBold28;
  final TextStyle subHeadlineGrayLightNormal28;
  final TextStyle subHeadlineGrayLightLight28;

  final TextStyle titleGrayLightBold24;
  final TextStyle titleGrayLightSemiBold24;
  final TextStyle titleGrayLightNormal24;
  final TextStyle titleGrayLightLight24;

  final TextStyle subtitleGrayLightBold20;
  final TextStyle subtitleGrayLightSemiBold20;
  final TextStyle subtitleGrayLightNormal20;
  final TextStyle subtitleGrayLightLight20;

  final TextStyle bodyGrayLightBold16;
  final TextStyle bodyGrayLightSemiBold16;
  final TextStyle bodyGrayLightNormal16;
  final TextStyle bodyGrayLightLight16;

  final TextStyle captionGrayLightBold15;
  final TextStyle captionGrayLightSemiBold15;
  final TextStyle captionGrayLightNormal15;
  final TextStyle captionGrayLightLight15;

  // Gray Medium styles
  final TextStyle headlineGrayMediumBold32;
  final TextStyle headlineGrayMediumSemiBold32;
  final TextStyle headlineGrayMediumNormal32;
  final TextStyle headlineGrayMediumLight32;

  final TextStyle subHeadlineGrayMediumBold28;
  final TextStyle subHeadlineGrayMediumSemiBold28;
  final TextStyle subHeadlineGrayMediumNormal28;
  final TextStyle subHeadlineGrayMediumLight28;

  final TextStyle titleGrayMediumBold24;
  final TextStyle titleGrayMediumSemiBold24;
  final TextStyle titleGrayMediumNormal24;
  final TextStyle titleGrayMediumLight24;

  final TextStyle subtitleGrayMediumBold20;
  final TextStyle subtitleGrayMediumSemiBold20;
  final TextStyle subtitleGrayMediumNormal20;
  final TextStyle subtitleGrayMediumLight20;

  final TextStyle bodyGrayMediumBold16;
  final TextStyle bodyGrayMediumSemiBold16;
  final TextStyle bodyGrayMediumNormal16;
  final TextStyle bodyGrayMediumLight16;

  final TextStyle captionGrayMediumBold15;
  final TextStyle captionGrayMediumSemiBold15;
  final TextStyle captionGrayMediumNormal15;
  final TextStyle captionGrayMediumLight15;

  Typography({required this.baseStyle})
      : headlineBlackBold32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.black,
        ),
        headlineGrayMediumBold32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.darkGrey,
        ),
        headlineGrayMediumSemiBold32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.darkGrey,
        ),
        headlineGrayMediumNormal32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.darkGrey,
        ),
        headlineGrayMediumLight32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.darkGrey,
        ),
        titleGrayMediumBold24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.darkGrey,
        ),
        titleGrayMediumSemiBold24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.darkGrey,
        ),
        titleGrayMediumNormal24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.darkGrey,
        ),
        titleGrayMediumLight24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.darkGrey,
        ),
        subtitleGrayMediumBold20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.darkGrey,
        ),
        subtitleGrayMediumSemiBold20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.darkGrey,
        ),
        subtitleGrayMediumNormal20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.darkGrey,
        ),
        subtitleGrayMediumLight20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.darkGrey,
        ),
        captionGrayMediumBold15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.darkGrey,
        ),
        captionGrayMediumSemiBold15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.darkGrey,
        ),
        captionGrayMediumNormal15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.darkGrey,
        ),
        captionGrayMediumLight15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.darkGrey,
        ),
        bodyGrayMediumBold16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.darkGrey,
        ),
        bodyGrayMediumSemiBold16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.darkGrey,
        ),
        bodyGrayMediumNormal16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.darkGrey,
        ),
        bodyGrayMediumLight16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.darkGrey,
        ),
        headlineBlackSemiBold32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.black,
        ),
        headlineBlackNormal32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.black,
        ),
        headlineBlackLight32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.black,
        ),
        subHeadlineBlackBold28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.black,
        ),
        subHeadlineBlackSemiBold28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.black,
        ),
        subHeadlineBlackNormal28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.black,
        ),
        subHeadlineGrayMediumBold28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.darkGrey,
        ),
        subHeadlineGrayMediumSemiBold28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.darkGrey,
        ),
        subHeadlineGrayMediumNormal28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.darkGrey,
        ),
        subHeadlineGrayMediumLight28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.darkGrey,
        ),
        subHeadlineBlackLight28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.black,
        ),
        titleBlackBold24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.black,
        ),
        titleBlackSemiBold24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.black,
        ),
        titleBlackNormal24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.black,
        ),
        titleBlackLight24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.black,
        ),
        subtitleBlackBold20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.black,
        ),
        subtitleBlackSemiBold20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.black,
        ),
        subtitleBlackNormal20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.black,
        ),
        subtitleBlackLight20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.black,
        ),
        bodyBlackBold16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.black,
        ),
        bodyBlackSemiBold16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.black,
        ),
        bodyBlackNormal16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.black,
        ),
        bodyBlackLight16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.black,
        ),
        captionBlackBold15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.black,
        ),
        captionBlackSemiBold15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.black,
        ),
        captionBlackNormal15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.black,
        ),
        captionBlackLight15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.black,
        ),
        headlineWhiteBold32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.white,
        ),
        headlineWhiteSemiBold32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.white,
        ),
        headlineWhiteNormal32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.white,
        ),
        headlineWhiteLight32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.white,
        ),
        subHeadlineWhiteBold28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.white,
        ),
        subHeadlineWhiteSemiBold28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.white,
        ),
        subHeadlineWhiteNormal28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.white,
        ),
        subHeadlineWhiteLight28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.white,
        ),
        titleWhiteBold24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.white,
        ),
        titleWhiteSemiBold24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.white,
        ),
        titleWhiteNormal24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.white,
        ),
        titleWhiteLight24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.white,
        ),
        subtitleWhiteBold20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.white,
        ),
        subtitleWhiteSemiBold20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.white,
        ),
        subtitleWhiteNormal20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.white,
        ),
        subtitleWhiteLight20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.white,
        ),
        bodyWhiteBold16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.white,
        ),
        bodyWhiteSemiBold16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.white,
        ),
        bodyWhiteNormal16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.white,
        ),
        bodyWhiteLight16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.white,
        ),
        captionWhiteBold15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.white,
        ),
        captionWhiteSemiBold15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.white,
        ),
        captionWhiteNormal15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.white,
        ),
        captionWhiteLight15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.white,
        ),
        headlinePurpleBold32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: TobetoColor.purple,
        ),
        headlinePurpleSemiBold32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: TobetoColor.purple,
        ),
        headlinePurpleNormal32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.normal,
          color: TobetoColor.purple,
        ),
        headlinePurpleLight32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w300,
          color: TobetoColor.purple,
        ),
        subHeadlinePurpleBold28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: TobetoColor.purple,
        ),
        subHeadlinePurpleSemiBold28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: TobetoColor.purple,
        ),
        subHeadlinePurpleNormal28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.normal,
          color: TobetoColor.purple,
        ),
        subHeadlinePurpleLight28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w300,
          color: TobetoColor.purple,
        ),
        titlePurpleBold24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: TobetoColor.purple,
        ),
        titlePurpleSemiBold24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: TobetoColor.purple,
        ),
        titlePurpleNormal24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.normal,
          color: TobetoColor.purple,
        ),
        titlePurpleLight24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w300,
          color: TobetoColor.purple,
        ),
        subtitlePurpleBold20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: TobetoColor.purple,
        ),
        subtitlePurpleSemiBold20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: TobetoColor.purple,
        ),
        subtitlePurpleNormal20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: TobetoColor.purple,
        ),
        subtitlePurpleLight20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: TobetoColor.purple,
        ),
        bodyPurpleBold16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: TobetoColor.purple,
        ),
        bodyPurpleSemiBold16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: TobetoColor.purple,
        ),
        bodyPurpleNormal16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: TobetoColor.purple,
        ),
        bodyPurpleLight16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: TobetoColor.purple,
        ),
        captionPurpleBold15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: TobetoColor.purple,
        ),
        captionPurpleSemiBold15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: TobetoColor.purple,
        ),
        captionPurpleNormal15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: TobetoColor.purple,
        ),
        captionPurpleLight15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: TobetoColor.purple,
        ),
        headlineGrayDarkBold32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.darkGrey,
        ),
        headlineGrayDarkSemiBold32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.darkGrey,
        ),
        headlineGrayDarkNormal32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.darkGrey,
        ),
        headlineGrayDarkLight32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.darkGrey,
        ),
        subHeadlineGrayDarkBold28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.darkGrey,
        ),
        subHeadlineGrayDarkSemiBold28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.darkGrey,
        ),
        subHeadlineGrayDarkNormal28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.darkGrey,
        ),
        subHeadlineGrayDarkLight28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.darkGrey,
        ),
        titleGrayDarkBold24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.darkGrey,
        ),
        titleGrayDarkSemiBold24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.darkGrey,
        ),
        titleGrayDarkNormal24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.darkGrey,
        ),
        titleGrayDarkLight24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.darkGrey,
        ),
        subtitleGrayDarkBold20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.darkGrey,
        ),
        subtitleGrayDarkSemiBold20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.darkGrey,
        ),
        subtitleGrayDarkNormal20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.darkGrey,
        ),
        subtitleGrayDarkLight20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.darkGrey,
        ),
        bodyGrayDarkBold16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.darkGrey,
        ),
        bodyGrayDarkSemiBold16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.darkGrey,
        ),
        bodyGrayDarkNormal16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.darkGrey,
        ),
        bodyGrayDarkLight16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.darkGrey,
        ),
        captionGrayDarkBold15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.darkGrey,
        ),
        captionGrayDarkSemiBold15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.darkGrey,
        ),
        captionGrayDarkNormal15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.darkGrey,
        ),
        captionGrayDarkLight15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.darkGrey,
        ),
        headlineGrayLightBold32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.lightGrey,
        ),
        headlineGrayLightSemiBold32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.lightGrey,
        ),
        headlineGrayLightNormal32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.lightGrey,
        ),
        headlineGrayLightLight32 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.lightGrey,
        ),
        subHeadlineGrayLightBold28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.lightGrey,
        ),
        subHeadlineGrayLightSemiBold28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.lightGrey,
        ),
        subHeadlineGrayLightNormal28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.lightGrey,
        ),
        subHeadlineGrayLightLight28 = baseStyle.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.lightGrey,
        ),
        titleGrayLightBold24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.lightGrey,
        ),
        titleGrayLightSemiBold24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.lightGrey,
        ),
        titleGrayLightNormal24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.lightGrey,
        ),
        titleGrayLightLight24 = baseStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.lightGrey,
        ),
        subtitleGrayLightBold20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.lightGrey,
        ),
        subtitleGrayLightSemiBold20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.lightGrey,
        ),
        subtitleGrayLightNormal20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.lightGrey,
        ),
        subtitleGrayLightLight20 = baseStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.lightGrey,
        ),
        bodyGrayLightBold16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.lightGrey,
        ),
        bodyGrayLightSemiBold16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.lightGrey,
        ),
        bodyGrayLightNormal16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.lightGrey,
        ),
        bodyGrayLightLight16 = baseStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.lightGrey,
        ),
        captionGrayLightBold15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: TobetoColor.text.lightGrey,
        ),
        captionGrayLightSemiBold15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.lightGrey,
        ),
        captionGrayLightNormal15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: TobetoColor.text.lightGrey,
        ),
        captionGrayLightLight15 = baseStyle.copyWith(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: TobetoColor.text.lightGrey,
        );
}

abstract class TobetoTextStyle {
  static Typography poppins = Typography(baseStyle: GoogleFonts.poppins());
  static Typography inter = Typography(baseStyle: GoogleFonts.inter());
}
