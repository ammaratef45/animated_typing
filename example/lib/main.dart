import 'package:animated_typing/animated_typing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _color = Colors.primaries[0];
  TextEditingController _controller = TextEditingController();
  double _seconds = 3;
  String _text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: _controller,
                onChanged: (_) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  labelText: 'text',
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButton<Color>(
                  underline: Container(),
                  iconSize: 0.0,
                  items: Colors.primaries
                      .map((color) => DropdownMenuItem<Color>(
                            value: color,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ))
                      .toList(),
                  onChanged: (v) {
                    setState(() {
                      _color = v;
                    });
                  },
                  value: _color,
                ),
                Slider(
                  value: _seconds,
                  onChanged: (newValue) {
                    setState(() {
                      _seconds = newValue;
                    });
                  },
                  min: 1,
                  max: 40,
                  divisions: 39,
                  label: '$_seconds seconds',
                )
              ],
            ),
            RaisedButton(
              child: Text('Start'),
              onPressed: () {
                _text = _controller.text;
                setState(() {});
              },
            ),
            AnimatedTyping(
              text: _text,
              duration: Duration(
                seconds: _seconds.toInt(),
              ),
              style: TextStyle(
                color: _color,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
