import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WordListPage extends StatelessWidget {
  const WordListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('単語一覧'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.push('/'),
        ),
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
