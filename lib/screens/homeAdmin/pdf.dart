import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginsss/screens/authenticate/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:loginsss/screens/homeAdmin/PdfPreviewScreen.dart';
import 'package:printing/printing.dart';

class Pdf extends StatefulWidget {
  @override
  _Pdf createState() => _Pdf();
}

class _Pdf extends State<Pdf> {
  final pdf = pw.Document();

  getdata() {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection("LockData")
            .orderBy('Time', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data.documents[index];
                    return Table(
                      border: TableBorder.all(
                          color: Colors.black26,
                          width: 1,
                          style: BorderStyle.none),
                      children: [
                        TableRow(children: [
                          TableCell(
                              child:
                                  Center(child: Text((index + 1).toString()))),
                          TableCell(
                              child: Center(child: Text(data["Lockernumber"]))),
                          TableCell(
                              child: Center(
                                  child:
                                      Text(data["Fine"].toString() + ' Bath'))),
                          TableCell(
                              child: Center(
                                  child: Text(
                                      data["Deposit"].toString() + ' Bath'))),
                          TableCell(
                              child: Center(
                            child: Text(DateTime.fromMicrosecondsSinceEpoch(
                                    data["Time"].microsecondsSinceEpoch)
                                .toString()),
                          )),
                        ]),
                      ],
                    );
                  },
                );
        },
      ),
    );
  }

  writeOnPdf() {
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Table.fromTextArray(
                context: context,
                data: const <List<String>>[
                  <String>['Year', 'Ipsum', 'Lorem'],
                  <String>['2000', 'Ipsum 1.0', 'Lorem 1'],
                  <String>['2001', 'Ipsum 1.1', 'Lorem 2'],
                  <String>['2002', 'Ipsum 1.2', 'Lorem 3'],
                  <String>['2003', 'Ipsum 1.3', 'Lorem 4'],
                  <String>['2004', 'Ipsum 1.4', 'Lorem 5'],
                  <String>['2004', 'Ipsum 1.5', 'Lorem 6'],
                  <String>['2006', 'Ipsum 1.6', 'Lorem 7'],
                  <String>['2007', 'Ipsum 1.7', 'Lorem 8'],
                  <String>['2008', 'Ipsum 1.7', 'Lorem 9'],
                ]),
          ); // Center
        })); // Page
  }

  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File("$documentPath/example.pdf");

    file.writeAsBytesSync(pdf.save());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Flutter"),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "PDF TUTORIAL",
              style: TextStyle(fontSize: 34),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          writeOnPdf();
          await savePdf();

          Directory documentDirectory =
              await getApplicationDocumentsDirectory();

          String documentPath = documentDirectory.path;

          String fullPath = "$documentPath/example.pdf";
          final pdf = await rootBundle.load(fullPath);
          await Printing.layoutPdf(onLayout: (_) => pdf.buffer.asUint8List());

          //Navigator.push(
          //    context,
          //    MaterialPageRoute(
          //        builder: (context) => PdfPreviewScreen(
          //              path: fullPath,
          //            )));
        },
        child: Icon(Icons.save),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
