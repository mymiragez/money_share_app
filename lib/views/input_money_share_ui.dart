// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_share_app/views/Show_money_share_ui.dart';

class InputMoneyShareUI extends StatefulWidget {
  const InputMoneyShareUI({super.key});

  @override
  State<InputMoneyShareUI> createState() => _InputMoneyShareUIState();
}

class _InputMoneyShareUIState extends State<InputMoneyShareUI> {
  //สร้างออปเจ็กต์ควบคุม text field
  //Alt+Shift+ลง ก๊อป
  TextEditingController moneyCtrl = TextEditingController(text: '');
  TextEditingController personCtrl = TextEditingController(text: '');
  TextEditingController tipCtrl = TextEditingController(text: '');

//สร้างตัวแปรเพื่อควบคุม checkbox
  bool tipCheck = false;

  //สร้าง เมธอดแสดง dialog แบบ warning dialog
  _showWarningDialog(context, msg) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Color.fromARGB(255, 224, 79, 95),
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: GoogleFonts.itim(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
            textAlign: TextAlign.center,
            style: GoogleFonts.itim(
              color: Color.fromARGB(255, 224, 79, 95),
              fontSize: MediaQuery.of(context).size.width * 0.05,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 224, 79, 95),
                  ),
                  child: Text(
                    'ตกลง',
                    style: GoogleFonts.itim(),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // gesture detector ให้ซ่อนคีย์บอร์ด
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 165, 165),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 246, 79, 95),
          title: Text(
            'แชร์เงินกับเถอะ',
            style: GoogleFonts.itim(
              fontSize: MediaQuery.of(context).size.width * 0.06,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          //siglechildescrollview scroll เลื่อนหน้าจอขึ้นเวลาเปิดคีย์บอร์ดล้นจอ
          child: Center(
            child: Column(
              //วางเรียงจากบนลงล่าง
              children: [
                /*Container(
                  height: MediaQuery.of(context).size.width *0.1,
                ),    //เว้นวรรคด้านบนของรูปใช้ sizedbox ก็ได้ */
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                Image.asset(
                  'assets/images/money.png',
                  width: MediaQuery.of(context).size.width * 0.35,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    controller: moneyCtrl,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.itim(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 0, 0),
                        ),
                      ),
                      hintText: 'ป้อนจำนวนเงิน (บาท)',
                      hintStyle: GoogleFonts.itim(
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.moneyBillWave,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Padding(
                  //person
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    controller: personCtrl,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.itim(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 0, 0),
                        ),
                      ),
                      hintText: 'ป้อนจำนวนคน (คน)',
                      hintStyle: GoogleFonts.itim(
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.045,
                ),
                Row(
                  //checkbox
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      onChanged: (data) {
                        //parameter เป็นค่าอะไรก็ได้ เช่น value เปลี่ยนเป็น data

                        //โค้ดคำสั่งใดก็ตามมีผลต่อการแสดงผลบนหน้าจอ ให้เขียนภายใต้คำสั่ง setState
                        setState(() {
                          tipCheck = data!;
                          if (data == false) {
                            //ถ้าเอาติ๊กออกให้ค่าในช่อง tip ว่าง
                            tipCtrl.text = '';
                          }
                        });
                      },
                      value: tipCheck, //แสดงว่าเริ่มต้นว่า checked ไม่ checked
                      side: BorderSide(
                        color: Color.fromARGB(255, 246, 79, 95),
                      ),
                      checkColor: Colors.yellow,
                      activeColor: Color.fromARGB(255, 246, 79, 95),
                    ),
                    Text(
                      'เงินทิป(บาท)',
                      style: GoogleFonts.itim(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Padding(
                  //tip
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    enabled: tipCheck, //อ้างอิง Checkbox
                    controller: tipCtrl,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.itim(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 246, 79, 95),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 0, 0),
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 157, 157, 157),
                        ),
                      ),
                      hintText: 'ป้อนจำนวนเงินทิป (บาท)',
                      hintStyle: GoogleFonts.itim(
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.moneyBillWheat,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        //press button, validate screen when validate success open ShowMoneyShareUI
                        //validate == ตรวจสอบ
                        if (moneyCtrl.text.isEmpty == true) {
                          //แสดง popup ว่ายังไม่ได้ป้อน
                          _showWarningDialog(context, 'ป้อนจำนวนเงินด้วย');
                        } else if (personCtrl.text.isEmpty == true) {
                          //แสดง popup ว่ายังไม่ได้ป้อน
                          _showWarningDialog(context, 'ป้อนจำนวนคนด้วย');
                        } else if (tipCheck == true) {
                          if (tipCtrl.text.isEmpty == true) {
                            //แสดง popup ว่ายังไม่ได้ป้อน
                            _showWarningDialog(context, 'ป้อนจำนวนทิปด้วย');
                          } else {
                            //เปิดหน้าจอพร้อมส่ง เงิน คน ทิป ที่ป้อน

                            //Open Other Screen Code (แบบย้อนกลับมาหน้าจอที่เปิดไปได้)
                            Navigator.push(
                              //push เปิดแล้วย้อนกลับได้,pushReplacement เปิดแล้วย้อนกลับไม่ได้
                              context, //หน้าจอนี้
                              MaterialPageRoute(
                                builder: (context) => ShowMoneyShareUI(
                                  //ข้อมูลที่จะส่ง
                                  money: moneyCtrl.text,
                                  person: personCtrl.text,
                                  tip: tipCtrl.text,
                                ),
                              ),
                            );
                          }
                        } else {
                          //เปิดหน้าจอพร้องส่งเงิน คน ที่ป้อน ทิปเป็น 0

                          //Open Other Screen Code (แบบย้อนกลับมาหน้าจอที่เปิดไปได้)
                          Navigator.push(
                            //push เปิดแล้วย้อนกลับได้,pushReplacement เปิดแล้วย้อนกลับไม่ได้
                            context, //หน้าจอนี้
                            MaterialPageRoute(
                              builder: (context) => ShowMoneyShareUI(
                                money: moneyCtrl.text,
                                person: personCtrl.text,
                                tip: "0",
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 0, 194, 26),
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.37,
                          MediaQuery.of(context).size.width * 0.14,
                        ),
                      ),
                      icon: Icon(
                        Icons.calculate,
                      ),
                      label: Text(
                        'คำนวณ',
                        style: GoogleFonts.itim(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        moneyCtrl.text = '';
                        personCtrl.text = '';
                        tipCtrl.text = '';
                        setState(() {
                          tipCheck = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 0, 76),
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.37,
                          MediaQuery.of(context).size.width * 0.14,
                        ),
                      ),
                      icon: Icon(
                        Icons.cancel,
                      ),
                      label: Text(
                        'ยกเลิก',
                        style: GoogleFonts.itim(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ),
                    ),
                    //ElevatedButton() มีแต่ข้อความ
                    //OutlinedButton() มีแต่เส้นกรอบ
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
