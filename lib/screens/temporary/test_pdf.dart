import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:resumex/providers/providers.dart';

import '../../api/pdf/pdfs.dart';

class TempPdf extends StatefulWidget {
  const TempPdf({Key? key}) : super(key: key);
  static const routeName = '/temp-pdf';
  @override
  State<TempPdf> createState() => _TempPdfState();
}

class _TempPdfState extends State<TempPdf> {
  double _marginLr = 20;
  double _marginTb = 40;
  double textScale = 1;
  @override
  Widget build(BuildContext context) {
    final res = Provider.of<ResumeModelProvider>(context);
    final infos = Provider.of<InfosModel>(context);
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 1.5,
            child: PdfPreview(
              previewPageMargin: const EdgeInsets.all(5),
              build: (format) => generateDocument2(
                PdfPageFormat.a4,
                [0, 10, 15, 25],
                res.currentResume(),
                _marginLr,
                _marginTb,
                textScale,
                0,
                infos,
              ),
              canDebug: false,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Margin sideways'),
          ),
          Slider(
            value: _marginLr,
            max: 50,
            divisions: 5,
            label: _marginLr.round().toString(),
            onChanged: (double value) {
              setState(() {
                _marginLr = value;
              });
            },
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Margin up down'),
          ),
          Slider(
            value: _marginTb,
            max: 80,
            divisions: 8,
            label: _marginTb.round().toString(),
            onChanged: (double value) {
              setState(() {
                _marginTb = value;
              });
            },
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Text Size'),
          ),
          Slider(
            value: textScale,
            min: 1,
            max: 5,
            divisions: 5,
            label: textScale.round().toString(),
            onChanged: (double value) {
              setState(() {
                textScale = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
