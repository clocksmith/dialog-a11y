import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

double _globalTextScaleFactor = 1.0;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialogs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        )
      ),
      home: MyHomePage(title: 'Dialogs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _textScaleFactor = 1.0;
  bool _adjustForTextScale = false;

  void _showDialog1(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: _globalTextScaleFactor,
          ),
          child: AlertDialog(
            adjustForTextScale: _adjustForTextScale,
            title: Text('Dialog title'),
            content: Text(
                'Use dialogs for errors that block an app’s normal operation or when providing  information that requires a specific user task, decision, or acknowledgement.'),
            actions: [
              FlatButton(
                child: Text('Action'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Action'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDialog2(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: _globalTextScaleFactor,
          ),
          child: AlertDialog(
            adjustForTextScale: _adjustForTextScale,
            title: Text('Very long dialog title, leading to a multi-line header'),
            content: Text(
                'A dialog is a type of modal window that appears in front of app content to provide critical information, or ask for a decision.'),
            actions: [
              FlatButton(
                child: Text('Action'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Action'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDialog3(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: _globalTextScaleFactor,
          ),
          child: AlertDialog(
            adjustForTextScale: _adjustForTextScale,
            content: Text(
                'A dialog is a type of modal window that appears in front of app content to provide critical information, or ask for a decision.'),
            actions: [
              FlatButton(
                child: Text('This is a long action'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('This is an even longer action'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: _textScaleFactor,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Tip: resize window to a portrait mobile size'),
              SizedBox(height: 20),
              Text(_adjustForTextScale ? 'New Behavior' : 'Current Behavior'),
              Switch(
                value: _adjustForTextScale,
                onChanged: (bool value) {
                  setState(() {
                    _adjustForTextScale = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text('Text Scale Factor'),
              Slider(
                value: _textScaleFactor,
                min: 0.5,
                max: 3.0,
                label: _textScaleFactor.toStringAsFixed(1),
                divisions: 25,
                onChanged: (double value) {
                  setState(() {
                    _textScaleFactor = value;
                    _globalTextScaleFactor = value;
                  });
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                child: Text('Show Dialog 1'),
                onPressed: () => _showDialog1(context),
              ),
              SizedBox(height: 20),
              RaisedButton(
                child: Text('Show Dialog 2'),
                onPressed: () => _showDialog2(context),
              ),
              SizedBox(height: 20),
              RaisedButton(
                child: Text('Show Dialog 3'),
                onPressed: () => _showDialog3(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
