import 'package:bmi/pages/bmi_result.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FormPage extends StatefulWidget {
  const FormPage({ Key? key }) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'คำนวณ BMI',
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              texthead(),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    box(Icons.av_timer, _weight, 'กรุณากรอกน้ำหนัก', 'น้ำหนัก (กิโลกรัม)'),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    box(Icons.vertical_align_top, _height, 'กรุณากรอกส่วนสูง', 'ส่วนสูง (เซนติเมตร)')
                  ],
                )
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              enterbtn(context),
            ],
          ),
        ),
      ),
    );
  }

  Text texthead() {
    return const Text(
              'คำนวณหาค่า BMI ของคุณ',
              style: TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.w600, 
              color: Colors.black87,
              ),
            );
  }
  ElevatedButton enterbtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          var route = MaterialPageRoute(
            builder: (context) => ResultPage(
              weight: _weight.text,
              height: _height.text,
            ),
          );
          Navigator.push(context, route);
        } else {
        }
      },
      child: const Text(
        'ยืนยัน',
        style: TextStyle(fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
          // primary: Colors.pink,
          fixedSize: const Size(150, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}

SizedBox box(ico,a,tx,u) {
  return SizedBox(
    width: 350,
    child: TextFormField(
      controller: a,
      validator: (value) {
        if (value!.isEmpty) {
          return tx;
        }
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        label: Text(
          u,
          style: TextStyle(color: Colors.grey[800], fontSize: 18),
        ),
        prefixIcon: Icon(ico),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.black,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.green,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
      ),
    ),
  );
}