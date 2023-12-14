import 'package:flutter/material.dart';
import 'main.dart';

class Length extends StatefulWidget {
  const Length({super.key});

  @override
  State<Length> createState() => _LengthState();
}
class _LengthState extends State<Length> {
  @override
  final input = TextEditingController();
  final out = TextEditingController();
  String newSelectedCurrency1 = "";
  String newSelectedCurrency2 = "";
  List<String> item = ['Сантиметр','Метр','Дециметр', 'Мили'];
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Длина",
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  margin: EdgeInsets.only(
                     bottom: 20,
                     right: 20,
                     left: 20),
                   decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(10),
                   boxShadow: const [BoxShadow(
                     color: Colors.grey,
                     offset: Offset(0.0, 0.0),
                     blurRadius: 10.0,
                     spreadRadius: 0.0,
                   ),],
                 ),
                 child: TextField(
                   controller: input,
                   keyboardType: TextInputType.number,
                   onEditingComplete: ()
                   {
                     editingComplete(newSelectedCurrency2.isEmpty? item[0] : newSelectedCurrency2,
                         newSelectedCurrency1.isEmpty? item[0] : (newSelectedCurrency1));
                   },
                   decoration: InputDecoration(
                     border: InputBorder.none,
                     hintText: "Введите число",
                     hintStyle: TextStyle(
                       color: Colors.black,
                       fontSize: 18,
                     ),
                   ),
                 ),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(
                     padding: EdgeInsets.symmetric(vertical: 5),
                     margin: EdgeInsets.only(
                         bottom: 20,
                         right: 10,
                         left: 20),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(10),
                       boxShadow: const [BoxShadow(
                         color: Colors.grey,
                         offset: Offset(0.0, 0.0),
                         blurRadius: 10.0,
                         spreadRadius: 0.0,
                       ),],
                     ),
                   child: DropdownButton<String>(
                     value: newSelectedCurrency2.isEmpty? item[0] : newSelectedCurrency2,
                     onChanged: (String? newValue) {
                       setState(() {
                         newSelectedCurrency2 = newValue!;
                       });
                     },
                     items: item
                         .map<DropdownMenuItem<String>>((String value) {
                       return DropdownMenuItem<String>(
                         value: value,
                         child: Text(
                           value,
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: 18,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                       );
                     }).toList(),
                     icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                     iconSize: 35,
                     underline: SizedBox(),
                   ),
                 ),
                 ElevatedButton(
                     onPressed: (){
                       var temp = newSelectedCurrency1;
                       setState(() {
                         newSelectedCurrency1 = newSelectedCurrency2;
                         newSelectedCurrency2 = temp;
                         editingComplete(newSelectedCurrency2.isEmpty? item[0] : newSelectedCurrency2,
                               newSelectedCurrency1.isEmpty? item[0] : (newSelectedCurrency1));
                       });
                     },
                     child: Icon(
                       Icons.swap_horiz,
                       color: Colors.black,
                       size: 25,
                     ),
                   style: ElevatedButton.styleFrom(
                     primary: Colors.white,
                     minimumSize: Size(30, 50),
                     elevation:10,
                   ),
                 ),
                 Container(
                   padding: EdgeInsets.symmetric(vertical: 5),
                   margin: EdgeInsets.only(
                       bottom: 20,
                       right: 20,
                       left: 10),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(10),
                     boxShadow: const [BoxShadow(
                       color: Colors.grey,
                       offset: Offset(0.0, 0.0),
                       blurRadius: 10.0,
                       spreadRadius: 0.0,
                     ),],
                   ),
                   child: DropdownButton<String>(
                     value: newSelectedCurrency1.isEmpty? item[0] : newSelectedCurrency1,
                     onChanged: (String? newValue) {
                       setState(() {
                         newSelectedCurrency1 = newValue!;
                       });
                     },
                     items: item
                         .map<DropdownMenuItem<String>>((String value) {
                       return DropdownMenuItem<String>(
                         value: value,
                         child: Text(
                           value,
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: 18,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                       );
                     }).toList(),
                     icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                     iconSize: 35,
                     underline: SizedBox(),
                   ),
                 ),
               ],
             ),
             Container(
               margin: EdgeInsets.only(
                   bottom: 20,
                   right: 20,
                   left: 20),
               child: TextField(
                 controller: out,
                 decoration: InputDecoration(
                   labelStyle: TextStyle(
                     color: Colors.white,
                   ),
                   border: InputBorder.none,
                   labelText: 'Конвертация в: '
                       '${newSelectedCurrency1.isEmpty? item[0] : (newSelectedCurrency1)}',
                   enabled: false,
                 ),
               ),
             ),
           ],
         ),
       ),
    );
  }
  void editingComplete(String droptext1, String droptext2) {
    if(input.text.isEmpty){}
    else if(double.tryParse(input.text) == null){}
    else if(double.parse(input.text)<=0){}
    else if(droptext1 == droptext2){out.text = input.text;}
    else {
      if (droptext1 == 'Дециметр' && droptext2 == 'Метр')
      {
        out.text = (double.parse(input.text) / 10).toString();
      }
      else if (droptext1 == 'Дециметр' && droptext2 == 'Сантиметр')
      {
        out.text = (double.parse(input.text) * 10).toString();
      }
      else if (droptext1 == 'Дециметр' && droptext2 == 'Мили')
      {
        out.text = (double.parse(input.text) * 0.000062).toString();
      }
      else if (droptext1 == 'Метр' && droptext2 == 'Дециметр')
      {
        out.text = (double.parse(input.text) * 10).toString();
      }
      else if (droptext1 == 'Метр' && droptext2 == 'Сантиметр')
      {
        out.text = (double.parse(input.text) * 100).toString();
      }
      else if (droptext1 == 'Метр' && droptext2 == 'Мили')
      {
        out.text = (double.parse(input.text) * 0.00062).toString();
      }
      else if (droptext1 == 'Сантиметр' && droptext2 == 'Дециметр')
      {
        out.text = (double.parse(input.text) / 10).toString();
      }
      else if (droptext1 == 'Сантиметр' && droptext2 == 'Метр')
      {
        out.text = (double.parse(input.text) / 100).toString();
      }
      else if (droptext1 == 'Сантиметр' && droptext2 == 'Мили')
      {
        out.text = (double.parse(input.text) * 0.0000062).toString();
      }
      else if (droptext1 == 'Мили' && droptext2 == 'Дециметр')
      {
        out.text = (double.parse(input.text) * 16093.44).toString();
      }
      else if (droptext1 == 'Мили' && droptext2 == 'Метр')
      {
        out.text = (double.parse(input.text) * 1609.34).toString();
      }
      else if (droptext1 == 'Мили' && droptext2 == 'Сантиметр')
      {
        out.text = (double.parse(input.text) * 160934.4).toString();
      }
    }
  }
  void DropdownChange(String newValue2, String oldValue1)
  {
    editingComplete(oldValue1,newValue2);
  }
}

