import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../base_widget/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: '出題くん',
        showBackButton: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.push('/test'),
              child: const Text('テスト開始'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.push('/test-settings'),
              child: const Text('テスト設定'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.push('/words'),
              child: const Text('単語管理'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.push('/cheers'),
              child: const Text('応援コメント管理'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.push('/learning-status'),
              child: const Text('学習状況'),
            ),
          ],
        ),
      ),
    );
  }
}
