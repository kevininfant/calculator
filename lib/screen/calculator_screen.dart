import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

import '../utils/theme_provider.dart';

class CalculatorMainScreen extends StatefulWidget {
  State<CalculatorMainScreen> createState() => _CalculatorMainScreenState();
}

class _CalculatorMainScreenState extends State<CalculatorMainScreen> {
  @override

  //  Empty Veriable to store datas

  String inputValue = '';
  String result = '';
  bool? isDarkMode;

  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    isDarkMode = themeProvider.isDarkMode;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 58.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu_sharp,
                        color: Theme.of(context).primaryColor,
                        size: 20.h,
                      )),
                  Text(
                    "Calculator",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800),
                  ),
                  IconButton(
                      onPressed: () {
                        isDarkMode = !isDarkMode!;
                        themeProvider.toggleTheme(isDarkMode!);
                      },
                      icon: Icon(
                         themeProvider.isDarkMode ?
                        Icons.wb_sunny: Icons.dark_mode ,
                        color: Theme.of(context).primaryColor,
                        size: 20.h,
                      ))
                ],
              ),
            ),
            Container(
              height: 170.h,
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(15)),
                child: _getTexts(),
              ),
            ),
            Expanded(
              flex: 70,
              child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    children: [
                      _getButtons('C', 'DE', '(', ')'),
                      _getButtons('7', '8', '9', '/'),
                      _getButtons('4', '5', '6', 'x'),
                      _getButtons('1', '2', '3', '+'),
                      _getButtons('.', '0', '=', '-'),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          inputValue,
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 30),
        ),
        SizedBox(height: 10),
        Text(
          result,
          style: TextStyle(
              color: Theme.of(context).primaryColor, fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _getButtons(String t1, String t2, String t3, String t4) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: TextButton(
                onPressed: () => Calculate(t1),
                child: Text(t1),
                style: TextButton.styleFrom(
                  backgroundColor:  Theme.of(context).backgroundColor,
                  shadowColor: Color.fromARGB(255, 201, 201, 201),
                  elevation: 10,
                  primary: getTextColor(t1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  textStyle: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () => Calculate(t2),
                child: Text(t2),
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).backgroundColor,
                  shadowColor: Color.fromARGB(255, 201, 201, 201),
                  elevation: 10,
                  primary: getTextColor(t2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  textStyle: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () => Calculate(t3),
                child: Text(t3),
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).backgroundColor,
                  shadowColor: Color.fromARGB(255, 201, 201, 201),
                  elevation: 10,
                  primary: getTextColor(t3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  textStyle: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () => Calculate(t4),
                child: Text(t4),
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).backgroundColor,
                  shadowColor: Color.fromARGB(255, 201, 201, 201),
                  elevation: 10,
                  primary: getTextColor(t4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  textStyle: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getTextColor(String x) {
    List<String> numbers = [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '.'
    ];
    List<String> operatos = ['(', ')', '/', 'x', '+', '-', '='];
    List<String> clears = ['C', 'DE'];

    if (numbers.contains(x)) {
      return Theme.of(context).primaryColor;
    } else if (operatos.contains(x)) {
      return Colors.blueAccent;
    } else if (clears.contains(x)) {
      return Colors.red;
    }

    return Theme.of(context).primaryColor;
  }

  void Calculate(String x) {
    setState(() {
      List<String> clearsResult = ['C', 'DE', '='];

      if (!clearsResult.contains(x) && result != '') {
        inputValue = result;
        result = '';
        inputValue += x;
      } else if (!clearsResult.contains(x)) {
        inputValue += x;
      } else if (x == 'DE') {
        inputValue = inputValue.substring(0, inputValue.length - 1);
      } else if (x == 'C') {
        inputValue = '';
        result = '';
      } else {
        Parser parser = Parser();
        Expression e = parser.parse(inputValue.replaceAll('x', '*'));
        ContextModel cm = ContextModel();
        result = e.evaluate(EvaluationType.REAL, cm).toString();
      }
    });
  }
}
