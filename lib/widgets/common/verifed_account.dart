import 'package:flutter/material.dart';

class VerifedAccount extends StatefulWidget {
  const VerifedAccount({Key? key}) : super(key: key);

  @override
  State<VerifedAccount> createState() => VerifedAccountState();
}

class VerifedAccountState extends State<VerifedAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/verifed.png',
              width: 164,
              height: 204,
            ),
          ],
        ),
      ),
    );
  }
}

