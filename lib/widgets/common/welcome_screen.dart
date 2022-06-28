import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:student_parent_app/widgets/common/confirm_account.dart';


void main() => runApp(const WelcomeScreen());

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: MyStatefulWidget(),
    )
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(20),
                child: const Image(
                  image: AssetImage("assets/images/circle.png"),
                  width: 45,
                  height: 43,
                )),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Welcome!',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'enter your registered no.',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              decoration:  BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(22)),
              padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        if (kDebugMode) {
                          print(number.phoneNumber);
                        }
                      },
                      onInputValidated: (bool value) {
                        if (kDebugMode) {
                          print(value);
                        }
                      },
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: const TextStyle(color: Colors.black),
                      textFieldController: controller,
                      formatInput: false,
                      maxLength: 10,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      cursorColor: Colors.black,
                      inputDecoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(bottom: 15, left: 0),
                        border: InputBorder.none,
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(
                            color: Colors.grey.shade500, fontSize: 16),
                      ),
                      onSaved: (PhoneNumber number) {
                        if (kDebugMode) {
                          print('On Saved: $number');
                        }
                      },
                    ),
                    Positioned(
                      left: 90,
                      top: 8,
                      bottom: 8,
                      child: Container(
                        height: 40,
                        width: 1,
                        color: Colors.black.withOpacity(0.13),
                      ),
                    )
                  ],
                )),
            Container(
              width: 310,
              height: 50,
              margin: const EdgeInsets.fromLTRB(25, 455, 25, 31),

              child:   ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(55),
                              side: const BorderSide(color: Colors.blue)
                          )
                      )
                  ),
                child: const Text('Next ->'),
                onPressed: () {
                  if (kDebugMode) {
                    print(controller.text);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const ConfirmAccount()));
                  }
                },
              ),
            ),
          ],
        ));
  }
}
