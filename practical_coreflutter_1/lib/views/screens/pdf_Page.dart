import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../Globals/Global_class.dart';
import '../../utils/color_utils.dart';

class pdf_Page extends StatefulWidget {
  const pdf_Page({super.key});

  @override
  State<pdf_Page> createState() => _pdf_PageState();
}

class _pdf_PageState extends State<pdf_Page> {
  FutureOr<Uint8List> generatePDF() async {
    var font = await PdfGoogleFonts.aladinRegular();

    pw.Document pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.all(15),
        build: (pw.Context contex) => pw.Center(
          child: pw.Container(
            width: double.infinity,
            height: double.infinity,
            decoration: pw.BoxDecoration(
              color: PdfColors.white,
            ),
            child: pw.ListView.builder(
                itemCount: Global.to_do_list_String.length,
                itemBuilder: (context, index) => pw.Container(
                    width: double.infinity,
                    height: 300,
                    decoration: pw.BoxDecoration(
                        color: PdfColors.grey,
                        borderRadius: pw.BorderRadius.circular(10)),
                    child: pw.Column(children: [
                      pw.Text("Title :${Global.to_do_list_String[index]}"),
                      pw.Text("Date : ${Global.to_do_Date[index]}"),
                      pw.Text(
                          "Time : ${Global.hour[index].toString()}:${Global.min[index].toString()}:${Global.sec[index].toString()}"),
                      pw.Text((Global.isDone[index]) ? "Done" : "NotDone"),
                    ]))),
          ),
        ),
      ),
    );
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF"),
        foregroundColor: theme_5,
        backgroundColor: theme_1,
        centerTitle: true,
      ),
      body: PdfPreview(
        build: (format) => generatePDF(),
      ),
    );
  }
}
