import 'package:flutter/material.dart';

class signUpPage extends StatelessWidget {
  const signUpPage({
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

    final textGPSStyle = TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic);

    return Scaffold(
        appBar: AppBar(title: Text('Midnattsloppet')),
        body: Column(
          children: [
            Text('Skriv in ditt anmälningsnummer: ', style: textHeadStyle),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nummer',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: updateStyle,
                onPressed: () {},
                child: const Text('Enter'),
              ),
            ),
          ],
        ));
  }
}
