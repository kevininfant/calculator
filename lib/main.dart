import 'package:calculator/screen/calculator_screen.dart';
import 'package:calculator/utils/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return MultiProvider(
    providers: [
         ChangeNotifierProvider.value(
          value: ThemeProvider(),
        ),
    ],
    child: Consumer<ThemeProvider>(
            builder: (context, theme, _) => ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
       builder: (BuildContext context,child) {      
         return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Calculator',
              themeMode: theme.themeMode,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              home:CalculatorMainScreen() ,
            ); },
          )),
  );
      }
    
  }

