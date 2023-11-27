import 'package:flutter/material.dart';
import 'package:sample_project_3/apis.dart';
import 'package:sample_project_3/number_fact_resp/number_fact_resp.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ScreenHome(),
    );
  }
}

class ScreenHome extends StatefulWidget {
  ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final _numberInputController = TextEditingController();

  String _resultText = 'Type any Number and press get result button';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _numberInputController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Number'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    final _number = _numberInputController.text;
                    final _result = await getNumberFact(number: _number);
                    print(_result.text);
                    setState(() {
                      _resultText = _result.text??'No text found';
                    });
                  },
                  child: Text('Get Result')
                  ),
                  Text(_resultText),
            ],
          ),
        ),
      ),
    );
  }
}
