import 'package:flutter/material.dart';

// DropdownMenuEntry labels and values for the first dropdown menu.
enum School {
  kth('KTH'),
  su('SU'),
  uu('UU');

  const School(this.label);
  final String label;
}

// TODO Fixa dessa så de beror på skola
enum Institution {
  disk('DISK'),
  fysik('Fysik'),
  jurist('Jurist');

  const Institution(this.label);
  final String label;
}

class SchoolSelectPage extends StatefulWidget {
  const SchoolSelectPage({
    super.key,
  });

  @override
  _SchoolSelectPageState createState() => _SchoolSelectPageState();
}

class _SchoolSelectPageState extends State<SchoolSelectPage> {
  String? selectedSchool;
  String? selectedInstitution;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/ml_logo.png',
          height: 40,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Välj din skola',
                  style: TextStyle(
                    fontSize: 20,
                  )),
              const SizedBox(height: 5),
              // Dropdown för skolor
              DropdownMenu<School>(
                width: 200,
                initialSelection: null,
                // requestFocusOnTap is enabled/disabled by platforms when it is null.
                // On mobile platforms, this is false by default. Setting this to true will
                // trigger focus request on the text field and virtual keyboard will appear
                // afterward. On desktop platforms however, this defaults to true.
                requestFocusOnTap: true,
                label: const Text('Skola'),
                onSelected: (School? school) {
                  setState(() {
                    selectedSchool = school?.label;
                  });
                },
                dropdownMenuEntries: School.values
                    .map<DropdownMenuEntry<School>>((School school) {
                  return DropdownMenuEntry<School>(
                    value: school,
                    label: school.label,
                  );
                }).toList(),
              ),
              const SizedBox(height: 15),
              const Text(
                'Välj din institution',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 5),
              // Dropdown för institutioner
              DropdownMenu<Institution>(
                width: 200,
                initialSelection: null,
                // requestFocusOnTap is enabled/disabled by platforms when it is null.
                // On mobile platforms, this is false by default. Setting this to true will
                // trigger focus request on the text field and virtual keyboard will appear
                // afterward. On desktop platforms however, this defaults to true.
                requestFocusOnTap: true,
                label: const Text('Institution'),
                onSelected: (Institution? institution) {
                  setState(() {
                    selectedInstitution = institution?.label;
                  });
                },
                dropdownMenuEntries: Institution.values
                    .map<DropdownMenuEntry<Institution>>(
                        (Institution institution) {
                  return DropdownMenuEntry<Institution>(
                    value: institution,
                    label: institution.label,
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 10, 179, 74),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text(
                            'Error: Functionality not implemented yet'),
                        action: SnackBarAction(
                            label: 'Reset',
                            textColor: Colors.white,
                            backgroundColor: Color.fromARGB(255, 234, 72, 51),
                            onPressed: () {
                              Navigator.popUntil(
                                  context,
                                  (Route<dynamic> predicate) =>
                                      predicate.isFirst);
                            })));
                  },
                  child: const Text('Enter',
                      style: TextStyle(color: Colors.white))),
            ],
          ),
        ),
      ),
    );
  }
}
