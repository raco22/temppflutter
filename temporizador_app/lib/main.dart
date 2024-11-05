import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temporizador',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: TimerPage(),
    );
  }
}

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _seconds = 0;
  Timer? _timer;

  void _startTimer() {
    if (_timer == null || !_timer!.isActive) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _seconds++;
        });
      });
    }
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null; // Asegúrate de que el temporizador se reinicie correctamente
  }

  void _resetTimer() {
    _stopTimer();
    setState(() {
      _seconds = 0;
    });
  }

  String get _formattedTime {
    final minutes = (_seconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Temporizador'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple[100],
              ),
              child: Center(
                child: Text(
                  _formattedTime,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _startTimer,
                  child: Text('Iniciar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, 
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _stopTimer,
                  child: Text('Parar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, 
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetTimer,
              child: Text('Resetear'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}