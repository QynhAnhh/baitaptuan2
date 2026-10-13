import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = '';

  void _calculate(String operator) {
    double? num1 = double.tryParse(_num1Controller.text);
    double? num2 = double.tryParse(_num2Controller.text);

    if (num1 == null || num2 == null) {
      setState(() => _result = 'Vui lòng nhập số hợp lệ');
      return;
    }

    double res = 0;
    switch (operator) {
      case '+': res = num1 + num2; break;
      case '-': res = num1 - num2; break;
      case '*': res = num1 * num2; break;
      case '/':
        if (num2 == 0) {
          setState(() => _result = 'Không thể chia cho 0');
          return;
        }
        res = num1 / num2;
        break;
    }
    setState(() => _result = 'Kết quả: $res');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thực hành 03'), automaticallyImplyLeading: false,),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => _calculate('+'), style: ElevatedButton.styleFrom(backgroundColor: Colors.red), child: const Text('+')),
                ElevatedButton(onPressed: () => _calculate('-'), style: ElevatedButton.styleFrom(backgroundColor: Colors.orange), child: const Text('-')),
                ElevatedButton(onPressed: () => _calculate('*'), style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple), child: const Text('*')),
                ElevatedButton(onPressed: () => _calculate('/'), style: ElevatedButton.styleFrom(backgroundColor: Colors.black), child: const Text('/')),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(_result, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}