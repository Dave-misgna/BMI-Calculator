import 'package:flutter/material.dart';

class BmiCalulator extends StatefulWidget {
  const BmiCalulator({super.key});

  @override
  State<BmiCalulator> createState() => _BmiCalulatorState();
}

class _BmiCalulatorState extends State<BmiCalulator> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  int _genderState = -1;
  void _genderSelection(int index) {
    setState(() {
      _genderState = index;
    });
  }

  double bmi = 0;
  String value = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
        elevation: 1,
        backgroundColor: Colors.black.withAlpha(2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  //Male Button
                  onPressed: () { 
                    _genderSelection(0);
                    },
                  
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(100, 100),
                      backgroundColor: Colors.white.withAlpha(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(10)),
                          side: BorderSide(
                            color: _genderState== 0 ? Colors.blue: Colors.transparent,
                            width: 2
                          )
                          ),
                      
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.male,
                        size: 50,
                        color: Colors.blue,
                      ),
                      Text(
                        'Male',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    _genderSelection(1);  
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(100, 100),
                      backgroundColor: Colors.white.withAlpha(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(10),
                          side: BorderSide(
                            color: _genderState== 1 ? Colors.red: Colors.transparent,
                            width: 2
                          )
                          )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.female,
                        size: 50,
                        color: Colors.red,
                      ),
                      Text(
                        'Female',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white.withAlpha(10),
                      borderRadius: BorderRadiusDirectional.circular(10)),
                  child: Column(
                    children: [
                      Text(
                        'Your height in Cm:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: heightController,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white.withAlpha(10),
                      borderRadius: BorderRadiusDirectional.circular(10)),
                  child: Column(
                    children: [
                      Text(
                        'Your Weight in Kg:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: weightController,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Text('Your BMI is:',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 16,
            ),
            Text('$value',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
            SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(250, 50),
                backgroundColor: const Color.fromARGB(255, 36, 81, 159),
              ),
              onPressed: () {
                try {
                  final double height = double.parse(heightController.text);
                  final double weight = double.parse(weightController.text);

                  if (height <= 0 || weight <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              "Height and weight must be greater than zero")),
                    );
                    return;
                  }

                  setState(() {
                    bmi = (weight / ((height / 100) * (height / 100)));
                    value = bmi.toStringAsFixed(2);
                  });
                } catch (e) {
                  // Show an error message if parsing fails
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter valid numbers")),
                  );
                }
              },
              child: Text('Calculate', style: TextStyle(fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }
}
