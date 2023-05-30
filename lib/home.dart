import 'package:flutter/material.dart';
import 'package:loginuicolors/login.dart';

void main() {
  runApp(home());
}

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/home.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: DropdownDatePickerExample(),
          ),
        ),
      ),
    );
  }
}

class DropdownDatePickerExample extends StatefulWidget {
  @override
  _DropdownDatePickerExampleState createState() =>
      _DropdownDatePickerExampleState();
}

class _DropdownDatePickerExampleState extends State<DropdownDatePickerExample> {
  String dropdownValue1 = 'Select State';
  DateTime? selectedDate;
  String dropdownValue3 = '';
  String? selectedValue;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              width: 110,
              child: DropdownButton<String?>(
                hint: Text('State'),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                  print("value");
                },
                items: ["A", "B", "C"]
                    .map(
                      (e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ),
                    )
                    .toList(),
              )),
          SizedBox(height: 16),
          if (selectedDate != null)
            Text(
              'Selected Date: ${selectedDate!.toIso8601String().split('T')[0]}',
              style: TextStyle(fontSize: 16),
            ),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: Text('Select Date'),
          ),
          SizedBox(height: 16),
          if (dropdownValue3.isNotEmpty)
            Container(
              width: 170,
              child: DropdownButton<String>(
                hint: Text("temperature"),
                value: dropdownValue3,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue3 = newValue!;
                  });
                },
                items: <String>[
                  'Select Temperature',
                  '23 Celcius',
                  '25 Celcius',
                  '27 Celcius',
                  '29 Celcius',
                  '32 Celcius',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          SizedBox(height: 16),
          Container(
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                // Perform submit action with the selected values and date
                print('Selected values:');
                print('Dropdown 1: $dropdownValue1');
                if (selectedDate != null) {
                  print(
                      'Selected date: ${selectedDate!.toIso8601String().split('T')[0]}');
                }
                print('Dropdown 3: $dropdownValue3');
              },
              child: Text('Submit'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
                      return MyLogin();
                    },),);
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xff4c505b),
                      fontSize: 30,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
