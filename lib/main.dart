import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urban_attires/routes/router.dart';
import 'package:urban_attires/ui/shared/my_colors.dart';
import 'package:urban_attires/ui/views/home_page.dart';
import 'package:urban_attires/ui/views/onboarding_screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(UrbanAttires());
  });
}

class UrbanAttires extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Urban Attires',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.ralewayTextTheme(textTheme).copyWith(
          headline6: GoogleFonts.raleway(),
          caption: GoogleFonts.raleway(),
          bodyText1: GoogleFonts.raleway(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: mainRoute,
      onGenerateRoute: Router.generateRoute,
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool onBoard = false;

  @override
  void initState() {
    super.initState();
    getOnboardingState();
  }

  getOnboardingState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      onBoard = prefs.getBool('onboard') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 392.7, height: 759.3);

    print(MediaQuery.of(context).size);

    return Scaffold(
      body: onBoard ? HomePage() : OnBoardingScreen(),
    );
  }
}
