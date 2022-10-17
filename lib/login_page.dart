import 'package:deriv_lite/home/home_page.dart';
import 'package:deriv_lite/main.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header
            const Align(
              alignment: Alignment.center,
              child: Text(
                'LOGIN',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),

            //spacing between header
            Container(
              height: 60,
            ),

            //email
            const Text(
              'EMAIL',
              style: TextStyle(color: Colors.white),
            ),
            const TextField(
              decoration: InputDecoration(
                focusColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 16,
            ),

            //password
            const Text(
              'PASSWORD',
              style: TextStyle(color: Colors.white),
            ),
            const TextField(
              decoration: InputDecoration(
                focusColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 16,
            ),

            //button
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => DerivHome())));
              },
              child: const Text('Login'),
              color: Colors.red,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
