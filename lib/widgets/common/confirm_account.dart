import 'package:flutter/material.dart';
import 'package:student_parent_app/widgets/common/verify_number.dart';

class ConfirmAccount extends StatefulWidget {
  const ConfirmAccount({Key? key}) : super(key: key);

  @override
  State<ConfirmAccount> createState() => _ConfirmAccountState();
}

class _ConfirmAccountState extends State<ConfirmAccount> {
  String? _selected;
  final List<Map> _myJson = [
    {
      'id': '1',
      'image': 'assets/images/profile.png',
      'name': 'Pratibha Jadhav',
      'class': 'Class VIII A'
    },
    {
      'id': '2',
      'image': 'assets/images/profile.png',
      'name': 'Shubham Landge',
      'class': 'Class VIII B'
    },
    {
      'id': '3',
      'image': 'assets/images/profile.png',
      'name': 'Siddesh Bhosale',
      'class': 'Class X A'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(24, 93, 24, 37),
              child: const Image(
                image: AssetImage("assets/images/circle.png"),
                width: 45,
                height: 43,
              )),
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: const Text(
                'Choose the account',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )),
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 38),
              child: const Text(
                'confirm your id',
                style: TextStyle(fontSize: 20),
              )),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                hint: const Text('Select Profile'),
                                value: _selected,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selected = newValue as String;
                                  });
                                },
                                items: _myJson.map((bankItem) {
                                  return DropdownMenuItem(
                                      value: bankItem['id'],
                                      child: Row(
                                        children: [
                                          Image.asset(bankItem['image'],
                                              width: 25),
                                          Column(
                                            children: [
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15),
                                                  child:
                                                      Text(bankItem['name'])),
                                              Container(
                                                  color: Colors.blue,
                                                  margin: const EdgeInsets.only(
                                                      left: 15),
                                                  child:
                                                      Text(bankItem['class'])),
                                            ],
                                          ),
                                        ],
                                      ));
                                }).toList(),
                              ))),
                    ),
                  ])),
          Container(
              padding: const EdgeInsets.fromLTRB(10, 350, 10, 0),
              child: const Text(
                'By continuing, you agree to the #school_app_project Terms of Service & Privacy Policy.',
                style: TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              )),
          Container(
            width: 310,
            height: 50,
            margin: const EdgeInsets.fromLTRB(25, 20, 25, 31),
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(29),
                            side: const BorderSide(color: Colors.blue)))),
                child: const Text('Accept & Continue ->'),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const VerifyNumber()));
                }),
          ),
        ]),
      ),
    )));
  }
}
