import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: mainScreen(),
    );
  }
}

class mainScreen extends StatefulWidget {
  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: bmiCalculator(),
    );
  }
}

class bmiCalculator extends StatefulWidget {
  @override
  _bmiCalculatorState createState() => _bmiCalculatorState();
}

class _bmiCalculatorState extends State<bmiCalculator> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult;
  String _message = "PLease enter your details";

  void _calculate() {
    final double height = double.tryParse(_heightController.value.text);
    final double weight = double.tryParse(_weightController.value.text);

    if (height <= 0 || weight <= 0) {
      setState(() {
        _message = "Please enter positive details";
      });
      return;
    }

    setState(() {
      _bmiResult = weight / (height * height);

      if (_bmiResult < 18.5) {
        _message = "You are underweight";
      } else if (_bmiResult < 25.0) {
        _message = "You are perfect";
      } else if (_bmiResult < 30.0) {
        _message = "You are overweight";
      } else {
        _message = "You are obuse";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 320,
        height: 400,
        child: Card(
          color: Colors.white,
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(hintText: "Enter height in Meters"),
                  keyboardType: TextInputType.number,
                  controller: _heightController,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Enter Weight in Kg"),
                  controller: _weightController,
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: _calculate,
                  color: Colors.blue,
                  child: Text("Calculater BMI"),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Text(
                    _bmiResult == null ? 'No Result' : _bmiResult.toStringAsFixed(2),
                    style: TextStyle(fontSize: 50),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(_message),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
