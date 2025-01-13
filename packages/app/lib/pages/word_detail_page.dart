import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WordDetailPage extends StatefulWidget {
  final String wordId;

  const WordDetailPage({
    super.key,
    required this.wordId,
  });

  @override
  State<WordDetailPage> createState() => _WordDetailPageState();
}

class _WordDetailPageState extends State<WordDetailPage> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();
  late String _word;
  late String _meaning;
  late String _partOfSpeech;
  late String _example;

  @override
  void initState() {
    super.initState();
    // TODO(me) : 単語データの取得
    _word = 'Sample Word';
    _meaning = 'サンプル単語';
    _partOfSpeech = '名詞';
    _example = 'This is a sample sentence.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('単語詳細'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.push('/words'),
        ),
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
                  content: const Text('この単語を削除しますか？'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('キャンセル'),
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO(me) : 単語を削除する処理
                        context.push('/words');
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
            _buildField(
              label: '英単語',
              value: _word,
              onSaved: (value) => _word = value ?? '',
            ),
            const SizedBox(height: 16),
            _buildField(
              label: '日本語訳',
              value: _meaning,
              onSaved: (value) => _meaning = value ?? '',
            ),
            const SizedBox(height: 16),
            if (_isEditing)
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
              )
            else
              _buildField(
                label: '品詞',
                value: _partOfSpeech,
                enabled: false,
              ),
            const SizedBox(height: 16),
            _buildField(
              label: '例文',
              value: _example,
              onSaved: (value) => _example = value ?? '',
              maxLines: 3,
            ),
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
                        // TODO(me) : 単語を更新する処理
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

  Widget _buildField({
    required String label,
    required String value,
    void Function(String?)? onSaved,
    bool enabled = true,
    int? maxLines,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      initialValue: value,
      enabled: _isEditing && enabled,
      maxLines: maxLines,
      onSaved: onSaved,
      validator: onSaved == null
          ? null
          : (value) {
              if (value == null || value.isEmpty) {
                return '$labelを入力してください';
              }
              return null;
            },
    );
  }
}
