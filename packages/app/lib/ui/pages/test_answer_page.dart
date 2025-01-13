import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../base_widget/app_bar.dart';

class TestAnswerPage extends StatefulWidget {
  const TestAnswerPage({super.key});

  @override
  State<TestAnswerPage> createState() => _TestAnswerPageState();
}

class _TestAnswerPageState extends State<TestAnswerPage> {
  bool? _isCorrect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: '答え',
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => context.go('/'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Sample Word',
                      style: TextStyle(fontSize: 32),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'サンプル単語',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isCorrect = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _isCorrect == false ? Colors.red : Colors.grey,
                  ),
                  child: const Text('不正解'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isCorrect = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _isCorrect ?? false ? Colors.green : Colors.grey,
                  ),
                  child: const Text('正解'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const TextField(
              decoration: InputDecoration(
                labelText: 'コメント',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => context.go('/'),
                  child: const Text('やめる'),
                ),
                ElevatedButton(
                  onPressed: () => context.push('/test'),
                  child: const Text('次のテスト'),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
