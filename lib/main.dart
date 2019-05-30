import 'package:flutter/material.dart';
import 'package:flutter_app/china_language.dart';
import 'package:flutter_app/china_language_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        ChinaLanguage.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('zh', 'CH'),
      ],
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
  Locale _locale;
  String language = "切换成中文";

  @override
  void initState() {
    super.initState();
    _locale = Locale('en', 'US');
  }

  void changeLanguage() {
    setState(() {
      if (language == "切换成中文") {
        language = "切换成英文";
        _locale = Locale('zh', 'CH');

      } else {
        language = "切换成中文";
        _locale = Locale('en', 'US');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Localizations.override(
        context: context,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
               ChinaLocalizations(_locale).taskTitle,
                style: TextStyle(fontSize: 17),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: RaisedButton(
                  onPressed: () {
                    changeLanguage();
                  },
                  child: Text(language),
                ),
              )
            ],
          ),
        ),
        locale: _locale,
      ),
    );
  }
}
