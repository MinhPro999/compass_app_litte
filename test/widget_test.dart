import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuaiNumberCalculator(),
    );
  }
}

class QuaiNumberCalculator extends StatefulWidget {
  const QuaiNumberCalculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuaiNumberCalculatorState createState() => _QuaiNumberCalculatorState();
}

class _QuaiNumberCalculatorState extends State<QuaiNumberCalculator> {
  final TextEditingController _yearController = TextEditingController();
  String? _gender;
  String _result = '';

  int calculateQuaiNumber(int yearOfBirth, String gender) {
    int lastTwoDigitsSum = (yearOfBirth % 10) + ((yearOfBirth ~/ 10) % 10);

    while (lastTwoDigitsSum >= 10) {
      lastTwoDigitsSum = (lastTwoDigitsSum % 10) + (lastTwoDigitsSum ~/ 10);
    }

    int quaiNumber;
    if (gender.toLowerCase() == 'nam') {
      quaiNumber =
          yearOfBirth < 2000 ? (10 - lastTwoDigitsSum) : (9 - lastTwoDigitsSum);
    } else {
      quaiNumber =
          yearOfBirth < 2000 ? (5 + lastTwoDigitsSum) : (6 + lastTwoDigitsSum);
    }

    if (quaiNumber == 5) {
      quaiNumber = gender.toLowerCase() == 'nam' ? 2 : 8;
    }

    return quaiNumber;
  }

  void _calculate() {
    int? year = int.tryParse(_yearController.text);
    if (year == null || _gender == null) {
      setState(() {
        _result = 'Vui lòng nhập năm sinh và chọn giới tính.';
      });
      return;
    }

    int quaiNumber = calculateQuaiNumber(year, _gender!);
    String menh = (quaiNumber == 1 ||
            quaiNumber == 3 ||
            quaiNumber == 4 ||
            quaiNumber == 9)
        ? 'Đông tứ mệnh'
        : 'Tây tứ mệnh';

    setState(() {
      _result = 'Quái số: $quaiNumber\nMệnh: $menh';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tính Quái Số'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _yearController,
              decoration: const InputDecoration(
                labelText: 'Năm sinh (âm lịch)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Nam'),
                    value: 'Nam',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Nữ'),
                    value: 'Nữ',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Tính Quái Số'),
            ),
            const SizedBox(height: 16),
            Text(
              _result,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
