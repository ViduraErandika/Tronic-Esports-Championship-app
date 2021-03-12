import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Rules extends StatefulWidget {
  static const String id = "rule_screen";

  @override
  _RulesState createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rules',
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Evil',
              letterSpacing: 1.5,
            )),
      ),
      body: SfPdfViewer.asset(
        'pdf/rules.pdf',
      ),
    );
  }
}
