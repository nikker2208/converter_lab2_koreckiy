import 'package:converter_lab2_koreckiy/Length.dart';
import 'package:converter_lab2_koreckiy/Weight.dart';
import 'package:converter_lab2_koreckiy/Pressure.dart';
import 'package:converter_lab2_koreckiy/Temp.dart';
import 'package:converter_lab2_koreckiy/Square.dart';
import 'package:flutter/material.dart';
import 'ButtMenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converter',
      theme: ThemeData.dark(),
      home: const Menu(),
      );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Меню",
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
          child: Center(
              child: Wrap(
                children: Btn.buttonValues
                    .map(
                      (value) => SizedBox(
                    width: value==Btn.p
                        ? screenSize.width/1
                        : (screenSize.width/2),
                    height: screenSize.width/3,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Material(
                        color: Colors.indigo,
                        clipBehavior: Clip.hardEdge,
                        shape: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.white24
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: InkWell(
                          onTap: () {
                            if (value == Btn.l){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Length()));
                            }
                            else if (value == Btn.m){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Weight()));
                            }
                            else if (value == Btn.p){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Pressure()));
                            }
                            else if (value == Btn.t){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Temp()));
                            }
                            else if (value == Btn.s){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Square()));
                            }
                          },
                          child: Center(
                            child: Text(
                              value,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                    .toList(),
              )
          ),
      ),
    );
  }
}


