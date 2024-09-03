import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test_app/landing.dart';
import 'package:test_app/utils/fonts.dart';

class NumericForm extends StatefulWidget {
  @override
  _NumericFormState createState() => _NumericFormState();
}

class _NumericFormState extends State<NumericForm> {
  final Map<String, TextEditingController> _controllers = {};

  final List<String> numericColumns = [
    'Cycle Length',
    'LengthofMenses',
    'Age',
    'Height',
    'Weight',
    'Numberpreg',
    'Miscarriages',
    'Abortions',
    'Livingkids',
    'NumberofDaysofIntercourse',
    'BMI',
  ];

  @override
  void initState() {
    super.initState();
    numericColumns.forEach((column) {
      _controllers[column] = TextEditingController();
    });
  }

  @override
  void dispose() {
    _controllers.forEach((key, controller) {
      controller.dispose();
    });
    super.dispose();
  }

  Future<void> _submit() async {
    final Map<String, dynamic> data = {};
    numericColumns.forEach((column) {
      data[column] = double.tryParse(_controllers[column]?.text ?? '') ?? 0.0;
    });

    try {
      final response = await http.post(
        Uri.parse('http://10.10.5.249:5000/predict'), // Updated with your server IP
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final prediction = result['prediction'];
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Prediction'),
            content: Text('Predicted Value: $prediction'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => LandingPage()));
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        _showErrorDialog('Failed to get prediction. Status code: ${response.statusCode}');
      }
    } catch (e) {
      _showErrorDialog('Failed to get prediction. Error: $e');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6D64FC),
        toolbarHeight: 80,
        title: Text('Enter your Info', style: Fonts.appbarTitileInverted),
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LandingPage()));
            },
            child: Icon(Icons.home, color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              ...numericColumns.map((column) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        column, // This is the title for each form field
                        style: Fonts.titleFontInverted,
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: _controllers[column],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                width: 2.0), // Set border color and width
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0), // Set border color and width when focused
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0), // Set border color and width when enabled
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0), // Set border color and width when disabled
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0), // Set border color and width when error
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0), // Set border color and width when focused error
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                  width: double.infinity, // Makes the button full-width
                  child: GestureDetector(
                    onTap: _submit,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 10,
                      ),
                      height: 50,
                      width: 150,
                      child: const Center(
                          child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
