import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CheerListPage extends StatelessWidget {
  const CheerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('応援コメント一覧'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.push('/'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.push('/cheers/add'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              isExpanded: true,
              value: '全て',
              items: ['全て', '正解時', '不正解時', '開始時', '終了時']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // TODO: フィルター処理
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // サンプルデータ
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('応援コメント ${index + 1}'),
                  subtitle: Text('表示タイミング: ${index % 2 == 0 ? "正解時" : "不正解時"}'),
                  onTap: () => context.push('/cheers/${index + 1}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
