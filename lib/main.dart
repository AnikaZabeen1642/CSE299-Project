import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medi_app/constant.dart';
import 'package:medi_app/global_bloc.dart';
import 'package:medi_app/pages/new_entry/new_entry_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'constant.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalBloc? globalBloc;

  @override
  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
      value: globalBloc!,
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Medicine Reminder',
          theme: ThemeData.dark().copyWith(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: kScaffoldColor,
            appBarTheme: AppBarTheme(
              toolbarHeight: 7.h,
              backgroundColor: kScaffoldColor,
              elevation: 0,
              iconTheme: IconThemeData(
                color: kSecondaryColor,
                size: 20.sp,
              ),
              titleTextStyle: GoogleFonts.mulish(
                color: kTextColor,
                fontWeight: FontWeight.w800,
                fontSize: 16.sp,
              ),
            ),
            textTheme: TextTheme(
              displaySmall: TextStyle(fontSize: 28.sp, color: kSecondaryColor, fontWeight: FontWeight.w500),
              headlineMedium: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w800, color: kTextColor),
              headlineSmall: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900, color: kTextColor),
              titleLarge: GoogleFonts.poppins(fontSize: 13.sp, color: kTextColor, fontWeight: FontWeight.w600),
              titleMedium: GoogleFonts.poppins(fontSize: 15.sp, color: kPrimaryColor),
              titleSmall: GoogleFonts.poppins(fontSize: 12.sp, color: kTextLightColor),
              bodySmall: GoogleFonts.poppins(fontSize: 9.sp, fontWeight: FontWeight.w400, color: kTextLightColor),
              labelMedium: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500, color: kTextColor),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: kTextLightColor, width: 0.7)),
              border: UnderlineInputBorder(borderSide: BorderSide(color: kTextLightColor)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryColor)),
            ),
            timePickerTheme: TimePickerThemeData(
              backgroundColor: kScaffoldColor,
              hourMinuteColor: kTextColor,
              hourMinuteTextColor: kScaffoldColor,
              dayPeriodColor: kTextColor,
              dayPeriodTextColor: kScaffoldColor,
              dialBackgroundColor: kTextColor,
              dialHandColor: kPrimaryColor,
              dialTextColor: kScaffoldColor,
              entryModeIconColor: kOtherColor,
              dayPeriodTextStyle: GoogleFonts.aBeeZee(fontSize: 8.sp),
            ),
          ),
          home: const HomePage(),
        );
      }),
    );
  }
}
