import 'package:flutter/material.dart';
import 'app_colors.dart';

// === BUTTON TEXT STYLES ===

final TextStyle buttonPrimaryTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: brandPrimaryColor,
);

final TextStyle buttonSecondaryTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: brandSecondaryColor,
);

final TextStyle buttonWhiteTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: neutralWhiteColor,
);

final TextStyle buttonDarkTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 15,
  fontWeight: FontWeight.w500,
  color: darkColor,
);

// === HEADINGS & TITLES ===

const TextStyle productTitleTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 20,
  fontWeight: FontWeight.bold,
  overflow: TextOverflow.ellipsis,
);

const TextStyle pageHeadingTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 18,
  fontWeight: FontWeight.w700,
  overflow: TextOverflow.ellipsis,
);

final TextStyle subheadingTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: textPrimaryColor,
  overflow: TextOverflow.ellipsis,
);

// === CARD & TILE TEXTS ===

final TextStyle cardTitleTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: textPrimaryColor,
  overflow: TextOverflow.ellipsis,
);

final TextStyle cardSubtitleTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: textSecondaryColor,
  overflow: TextOverflow.ellipsis,
);

final TextStyle cardBodyTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: textMutedColor,
  overflow: TextOverflow.ellipsis,
);

// === ALERTS & FEEDBACK ===

final TextStyle alertMessageTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: statusErrorColor,
  overflow: TextOverflow.ellipsis,
);

final TextStyle alertBoldTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: statusErrorColor,
  overflow: TextOverflow.ellipsis,
);
