import 'package:flutter/material.dart';

class DaysScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text('สรุปยอดรายวัน'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('วันที่'),
                      trailing: Text('02/12/2563'),
                    ),
                    ListTile(
                      title: Text('จำนวนรถที่ล็อค'),
                      trailing: Text('10 คัน'),
                    ),
                    ListTile(
                      title: Text('จำนวนเงินค่าปรับรวม'),
                      trailing: Text('10,000 บาท'),
                    ),
                    ListTile(
                      title: Text('เงินค่ามัดจำอุปกรณ์รวม'),
                      trailing: Text('30,000 บาท'),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('วันที่'),
                      trailing: Text('01/12/2563'),
                    ),
                    ListTile(
                      title: Text('จำนวนรถที่ล็อค'),
                      trailing: Text('6 คัน'),
                    ),
                    ListTile(
                      title: Text('จำนวนเงินค่าปรับรวม'),
                      trailing: Text('6,000 บาท'),
                    ),
                    ListTile(
                      title: Text('เงินค่ามัดจำอุปกรณ์รวม'),
                      trailing: Text('18,000 บาท'),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('วันที่'),
                      trailing: Text('30/11/2563'),
                    ),
                    ListTile(
                      title: Text('จำนวนรถที่ล็อค'),
                      trailing: Text('9 คัน'),
                    ),
                    ListTile(
                      title: Text('จำนวนเงินค่าปรับรวม'),
                      trailing: Text('9,000 บาท'),
                    ),
                    ListTile(
                      title: Text('เงินค่ามัดจำอุปกรณ์รวม'),
                      trailing: Text('27,000 บาท'),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('วันที่'),
                      trailing: Text('29/11/2563'),
                    ),
                    ListTile(
                      title: Text('จำนวนรถที่ล็อค'),
                      trailing: Text('3 คัน'),
                    ),
                    ListTile(
                      title: Text('จำนวนเงินค่าปรับรวม'),
                      trailing: Text('3,000 บาท'),
                    ),
                    ListTile(
                      title: Text('เงินค่ามัดจำอุปกรณ์รวม'),
                      trailing: Text('9,000 บาท'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
