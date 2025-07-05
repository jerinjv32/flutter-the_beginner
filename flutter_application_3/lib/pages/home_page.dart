import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _keys = [
    '1',
    '2',
    '3',
    '+',
    '4',
    '5',
    '6',
    '-',
    '7',
    '8',
    '9',
    '/',
    '0',
    '*',
    'c',
    '=',
  ];
  final List<String> _operators = ["+", "-", "*", "/"];
  String _display = "";

  double _calculation(String incExpression) {
    try{
      ExpressionParser p = GrammarParser();
      Expression exp = p.parse(incExpression);
      double answer = exp.evaluate(EvaluationType.REAL, ContextModel());
      return answer;
    } catch (e) {
      return 0;
    }
  }
  void _printItem(String item) {
    setState(() {
      switch (item) {
        case "c":
          _display ="";
        case "=":
          double answer = _calculation(_display);
          _display = answer.toString();
        default:
          _display = "$_display$item";
      }      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calaculator"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _display,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff91d2ff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 10,
                ),
                itemCount: _keys.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _printItem(_keys[index]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: _operators.contains(_keys[index]) ? Colors.deepOrange : Colors.blueAccent[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: Offset(-2, 3),
                          )
                        ]
                      ),
                      child: Center(
                        child: Text(
                          _keys[index],
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}