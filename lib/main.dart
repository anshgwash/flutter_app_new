import 'package:flutter/material.dart';
import 'package:flutter_app_new/screens/home.dart';

import 'dart:io';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

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
      ),
      home: HomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<List<TextLine>> getPDF() async {
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;

      String urlStr =
          "https://www.hdfcbank.com/content/bbp/repositories/723fb80a-2dde-42a3-9793-7ae1be57c87f/?path=/Personal/Home/content/rates.pdf";
      var url = Uri.parse(urlStr);
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      File file = new File('$tempPath/nice.pdf');
      File urlFile = await file.writeAsBytes(bytes);

      PdfDocument document = PdfDocument(inputBytes: urlFile.readAsBytesSync());
      List<TextLine> textline = PdfTextExtractor(document).extractTextLines();
      String text = PdfTextExtractor(document).extractText();
      textline.forEach((element) {
        print(element.text);
      });
      document.dispose();
      return textline;
    }

    getPDF();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
