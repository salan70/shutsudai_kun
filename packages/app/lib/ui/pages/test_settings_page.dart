import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../base_widget/app_bar.dart';

class TestSettingsPage extends StatefulWidget {
  const TestSettingsPage({super.key});

  @override
  State<TestSettingsPage> createState() => _TestSettingsPageState();
}

class _TestSettingsPageState extends State<TestSettingsPage> {
  String _selectedRange = '番号';
  // int _startNumber = 1;
  // int _endNumber = 10;
  // final int _questionCount = 10;
  // int _cheerInterval = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'テスト設定',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: _selectedRange,
              items: ['番号', 'ランク', '状態'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedRange = newValue;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            if (_selectedRange == '番号') ...[
              TextField(
                decoration: const InputDecoration(labelText: '開始番号'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    // _startNumber = int.tryParse(value) ?? 1;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: '終了番号'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    // _endNumber = int.tryParse(value) ?? 10;
                  });
                },
              ),
            ],
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: '応援表示頻度'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  // _cheerInterval = int.tryParse(value) ?? 5;
                });
              },
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => context.push('/test'),
                  child: const Text('テスト開始'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
