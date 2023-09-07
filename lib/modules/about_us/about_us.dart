import 'package:flutter/material.dart';
import 'package:new_test_99/constant.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            secondBackColor,
            firstBackColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Our app is an ecommerce to surfe retorante products.",
                style: TextStyle(fontSize: 20, color: white),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "created at: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: white),
                  ),
                  Text(
                    " 2021-12-30",
                    style: TextStyle(fontSize: 20, color: Colors.amber),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "updated at: ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: white),
                  ),
                  Text(
                    " 2022-1-3",
                    style: TextStyle(fontSize: 20, color: Colors.amber),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Powerd by:',
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.bold, color: white),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Anwar Shiekh Alard.',
                style: TextStyle(fontSize: 20, color: Colors.amber),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Ahmed Mohammed.',
                style: TextStyle(fontSize: 20, color: Colors.amber),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Riad Al-khateb.',
                style: TextStyle(fontSize: 20, color: Colors.amber),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Rahaf Abu Shahen.',
                style: TextStyle(fontSize: 20, color: Colors.amber),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    )));
  }
}
