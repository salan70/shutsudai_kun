import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../base_widget/app_bar.dart';

class WordAddPage extends StatefulWidget {
  const WordAddPage({super.key});

  @override
  State<WordAddPage> createState() => _WordAddPageState();
}

class _WordAddPageState extends State<WordAddPage> {
  final _formKey = GlobalKey<FormState>();
  // String _word = '';
  // String _meaning = '';
  String _partOfSpeech = '名詞';
  // String _example = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: '単語追加',
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: '英単語',
                border: OutlineInputBorder(),
              ),
              // onSaved: (value) => _word = value ?? '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '英単語を入力してください';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: '日本語訳',
                border: OutlineInputBorder(),
              ),
              // onSaved: (value) => _meaning = value ?? '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '日本語訳を入力してください';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: '品詞',
                border: OutlineInputBorder(),
              ),
              value: _partOfSpeech,
              items: ['名詞', '動詞', '形容詞', '副詞', '前置詞', '接続詞']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _partOfSpeech = newValue;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: '例文',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              // onSaved: (value) => _example = value ?? '',
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => context.push('/words'),
                  child: const Text('キャンセル'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      // TODO(me) : 単語を保存する処理
                      context.push('/words');
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
