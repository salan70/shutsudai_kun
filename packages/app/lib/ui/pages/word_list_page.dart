import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../base_widget/app_bar.dart';

class WordListPage extends StatelessWidget {
  const WordListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: '単語一覧',
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.push('/words/add'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: '検索',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // サンプルデータ
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Word ${index + 1}'),
                  subtitle: Text('単語 ${index + 1}'),
                  onTap: () => context.push('/words/${index + 1}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
