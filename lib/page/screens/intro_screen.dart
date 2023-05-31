import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../auth/auth.dart';
import '../../widget/original_button.dart';


class IntroScreen extends StatelessWidget {
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(),
            Center(
              child: Hero(
                tag: 'logoAnimation',
                child:
                Image.asset(  'assets/images/tasktodo.jpeg' ,
                
                   fit: BoxFit.cover,
                ),)
              ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: OriginalButton(
                text: 'Get Started',
                color: Colors.white,
                textColor: Colors.lightBlue,
                onPressed: () {
                     Navigator.of(context).pushNamed('login');
                  
                  
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}