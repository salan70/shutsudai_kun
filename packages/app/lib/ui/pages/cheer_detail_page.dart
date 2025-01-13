import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../base_widget/app_bar.dart';

class CheerDetailPage extends StatefulWidget {
  final String cheerId;

  const CheerDetailPage({
    super.key,
    required this.cheerId,
  });

  @override
  State<CheerDetailPage> createState() => _CheerDetailPageState();
}

class _CheerDetailPageState extends State<CheerDetailPage> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();
  late String _comment;
  late String _timing;
  final DateTime _createdAt = DateTime.now(); // サンプルデータ
  final DateTime _updatedAt = DateTime.now(); // サンプルデータ

  @override
  void initState() {
    super.initState();
    // TODO(me) : 応援コメントデータの取得
    _comment = 'サンプル応援コメント';
    _timing = '正解時';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: '応援コメント詳細',
        actions: [
          if (!_isEditing)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => setState(() => _isEditing = true),
            ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('確認'),
                  content: const Text('この応援コメントを削除しますか？'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('キャンセル'),
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO(me) : 応援コメントを削除する処理
                        context.push('/cheers');
                      },
                      child: const Text('削除'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
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
              initialValue: _comment,
              enabled: _isEditing,
              maxLines: 3,
              onSaved: (value) => _comment = value ?? '',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'コメントを入力してください';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            if (_isEditing)
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
              )
            else
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '表示タイミング',
                  border: OutlineInputBorder(),
                ),
                initialValue: _timing,
                enabled: false,
              ),
            const SizedBox(height: 16),
            Text('作成日時: ${_createdAt.toString()}'),
            Text('更新日時: ${_updatedAt.toString()}'),
            if (_isEditing) ...[
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => setState(() => _isEditing = false),
                    child: const Text('キャンセル'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        // TODO(me) : 応援コメントを更新する処理
                        setState(() => _isEditing = false);
                      }
                    },
                    child: const Text('保存'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
