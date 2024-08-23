import 'package:flutter/material.dart';

import 'output.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final List<double> _grades = List.generate(6, (index) => 0.0);
  final List<String> _subjects = List.generate(6, (index) => '');

  double calculateGPA() {
    double total = _grades.reduce((a, b) => a + b);
    return total / _grades.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Grades',style: TextStyle(color: Color(0xffF2E8C6)),),
        backgroundColor: const Color(0xFF800000),
      ),
      backgroundColor: const Color(0xffF2E8C6),

       body:SingleChildScrollView(child: Column(
         children: [
           for (int i = 0; i < 6; i++)
             Padding(
               padding: const EdgeInsets.only(left: 8,top: 8,right: 8,bottom: 8),
               child: Row(
                 children: [
                   Expanded(
                     child: TextFormField(
                       onChanged: (value) {
                         setState(() {
                           _subjects[i] = value;
                         });
                       },
                       decoration: const InputDecoration(


                         labelText: 'Enter the subject name',
                         enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffDAD4B5))),

                         focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(0xFF982B1C) )),
                         border: OutlineInputBorder(
                             borderSide: BorderSide(color:Color(0xff800000) )
                         ),
                         labelStyle:  TextStyle(color: Color(0xFF982B1C)),
                       ),
                     ),
                   ),
                   const SizedBox(width: 16.0),
                   Expanded(
                     child: Column(
                       children: [
                         Slider(
                           value: _grades[i],
                           min: 0,
                           max: 100,
                           divisions: 100,
                           label: _grades[i].round().toString(),
                           activeColor: const Color(0xFF982B1C),
                           inactiveColor: const Color(0xffDAD4B5),
                           onChanged: (value) {
                             setState(() {
                               _grades[i] = value;
                             });
                           },
                         ),
                         Text(
                           _grades[i].toStringAsFixed(1),
                           style: const TextStyle(color: Color(0xFF982B1C)),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
           const SizedBox(height: 155),

           Container(
             height: 100,
             width: double.infinity,
             decoration: const BoxDecoration(
               color: Color(0xFF800000),
             ),
             child: TextButton(
               onPressed: () {
                 double gpa = calculateGPA();
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                       builder: (context) => GPAOutput(gpa: gpa)),
                 );
               },
               child: const Center(
                 child: Text(
                   "Calculate GPA",
                   style: TextStyle(fontSize: 32, color: Color(0xffF2E8C6)),
                 ),
               ),
             ),
           ),
         ],
       ),)

    );
  }
}
