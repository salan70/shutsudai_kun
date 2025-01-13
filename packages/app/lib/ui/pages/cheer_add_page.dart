import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../base_widget/app_bar.dart';

class CheerAddPage extends StatefulWidget {
  const CheerAddPage({super.key});

  @override
  State<CheerAddPage> createState() => _CheerAddPageState();
}

class _CheerAddPageState extends State<CheerAddPage> {
  final _formKey = GlobalKey<FormState>();
  // String _comment = '';
  String _timing = '正解時';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: '応援コメント追加'),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'コメント',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              // onSaved: (value) => _comment = value ?? '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'コメントを入力してください';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: '表示タイミング',
                border: OutlineInputBorder(),
              ),
              value: _timing,
              items: ['正解時', '不正解時', '開始時', '終了時']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _timing = newValue;
                  });
                }
              },
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => context.push('/cheers'),
                  child: const Text('キャンセル'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      // TODO(me) : 応援コメントを保存する処理
                      context.push('/cheers');
                    }
                  },
                  child: const Text('保存'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
