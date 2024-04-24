import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle updateStyle = ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        textStyle: const TextStyle(fontSize: 20));
    final ButtonStyle deleteStyle = ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        textStyle: const TextStyle(fontSize: 20));

    final textHeadStyle =
        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'images/ml_logo.png',
            height: 40,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Skriv in ditt anmälningsnummer: ',
                  style: textHeadStyle),
            ),
            Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: 300,
                height: 64,
                child: TextField(
                  // Only allow number input
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nummer',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 10, 179, 74),
                  ),
                  onPressed: () {},
                  child: Text('Enter', style: TextStyle(color: Colors.white))),
            ),
          ],
        ));
  }
}
