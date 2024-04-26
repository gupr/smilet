import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smilet/SchoolSelectPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int regNummer = 0;
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textHeadStyle =
        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'assets/images/ml_logo.png',
            height: 40,
          ),
        ),
        // Form för att kunna använda TextFormField
        body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Text('Skriv in ditt anmälningsnummer: ',
                      style: textHeadStyle),
                ),
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 300,
                    height: 64,
                    child: TextFormField(
                      // Only allow number input
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nummer',
                        hintText: 'Ange nummer',
                      ),
                      onSaved: (String? value) {},
                      // Kolla numrets giltighet
                      validator: (String? value) {
                        int? valueInt = int.tryParse(value.toString());
                        return (value != null && (isValidRegNumber(valueInt)))
                            ? 'Ogiltigt anmälningsnummer!'
                            : null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 10, 179, 74),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text('Anmälningsnummer giltigt!')),
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SchoolSelectPage()));
                        }
                      },
                      child: const Text('Enter',
                          style: TextStyle(color: Colors.white))),
                ),
              ],
            )));
  }

  // Hjälparmetod för att avgöra om ett anmälningsnummer är giltigt
  bool isValidRegNumber(int? number) {
    if (number == null) return true;
    // TODO: vad är valid anmälningsnummer?
    return (number < 1000);
  }
}
