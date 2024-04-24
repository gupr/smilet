import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';

import 'SignUpPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Smilet',
        debugShowCheckedModeBanner: false,
        home: WelcomePage(title: ""),
        theme: ThemeData(
          // Background color of app
          scaffoldBackgroundColor: Color.fromARGB(255, 62, 71, 129),
          useMaterial3: true,
          // Change page transition
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
          }),

          // Define the default brightness and colors.
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 2, 67, 121),
            // ···
            brightness: Brightness.dark,
          ),
        ));
  }
}

class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 8, 77, 188),
        elevation: 0,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: SizedBox(
                width: 300,
                height: 300,
                child: Image.asset(
                  'images/midnattslopp.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Text('Det är ',
                style: TextStyle(
                  fontSize: 20,
                )),
            CountDownText(
              due: DateTime.parse("2024-08-17"),
              finishedText: "ingen tid",
              showLabel: true,
              longDateName: false,
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 243, 115),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text('kvar till Midnattsloppet!',
                style: TextStyle(
                  fontSize: 20,
                )),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 249, 138, 11),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: Text('Kom in', style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }
}
