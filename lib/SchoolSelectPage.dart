import 'package:flutter/material.dart';

// DropdownMenuEntry labels and values for the first dropdown menu.
enum School {
  KTH('KTH'),
  SU('SU'),
  UU('UU');

  const School(this.label);
  final String label;
}

// TODO Fixa dessa så de beror på skola
enum Institution {
  DISK('DISK'),
  FYSIK('Fysik'),
  JURIST('Jurist');

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
          'images/ml_logo.png',
          height: 40,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: <Widget>[
              Text('Välj din skola',
                  style: TextStyle(
                    fontSize: 20,
                  )),
              SizedBox(height: 5),
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
              SizedBox(height: 15),
              Text(
                'Välj din institution',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 5),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
