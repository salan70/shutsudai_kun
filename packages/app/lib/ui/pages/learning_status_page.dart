import 'package:flutter/material.dart';

import '../base_widget/app_bar.dart';

class LearningStatusPage extends StatelessWidget {
  const LearningStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: '学習状況',
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '期間',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton.icon(
                          onPressed: () {
                            // TODO(me) : 開始日選択
                          },
                          icon: const Icon(Icons.calendar_today),
                          label: const Text('2024/01/01'),
                        ),
                      ),
                      const Text('〜'),
                      Expanded(
                        child: TextButton.icon(
                          onPressed: () {
                            // TODO(me) : 終了日選択
                          },
                          icon: const Icon(Icons.calendar_today),
                          label: const Text('2024/01/31'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '学習概要',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '総学習時間',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            '12:34',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '総問題数',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            '100',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '正答率',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            '80%',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '詳細データ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          // TODO(me) : CSVエクスポート
                        },
                        icon: const Icon(Icons.download),
                        label: const Text('CSVエクスポート'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('日付')),
                        DataColumn(label: Text('学習時間')),
                        DataColumn(label: Text('問題数')),
                        DataColumn(label: Text('正解数')),
                        DataColumn(label: Text('不正解数')),
                        DataColumn(label: Text('正答率')),
                      ],
                      rows: List.generate(
                        10,
                        (index) => DataRow(
                          cells: [
                            DataCell(Text('2024/01/${index + 1}')),
                            const DataCell(Text('1:23')),
                            const DataCell(Text('10')),
                            const DataCell(Text('8')),
                            const DataCell(Text('2')),
                            const DataCell(Text('80%')),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
