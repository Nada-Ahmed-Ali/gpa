import 'package:flutter/material.dart';

class GPAOutput extends StatelessWidget {
  final double gpa;

  const GPAOutput({super.key, required this.gpa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GPA Result",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500,color: Color(0xffF2E8C6)),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF800000),
      ),
      backgroundColor: const Color(0xFFF2E8C6),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 250),
            child: Text(
              "Your Result",
              style: TextStyle(fontSize: 35, color: Color(0xFF982B1C)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFDAD4B5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          getResultText(gpa),
                          style: const TextStyle(
                            color: Color(0xFF800000),
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        gpa.toStringAsFixed(2), // Show GPA result
                        style: const TextStyle(fontSize: 64, color: Color(0xFF982B1C)),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        getDescText(gpa),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF982B1C),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF800000),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Center(
                child: Text(
                  "Re-Calculate GPA",
                  style: TextStyle(fontSize: 32, color:  Color(0xffF2E8C6)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to determine GPA category
  String getResultText(double gpa) {
    if (gpa >= 90) {
      return "Excellent";
    } else if (gpa >= 80) {
      return "Very Good";
    } else if (gpa >= 70) {
      return "Good";
    } else if (gpa >= 60) {
      return "Pass";
    } else {
      return "Fail";
    }
  }

  String getDescText(double gpa) {
    if (gpa >= 90) {
      return "You did an excellent job!";
    } else if (gpa >= 80) {
      return "You did very well!";
    } else if (gpa >= 70) {
      return "Good effort!";
    } else if (gpa >= 60) {
      return "You passed!";
    } else {
      return "Consider improving your grades.";
    }
  }
}
