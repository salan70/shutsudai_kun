import 'package:go_router/go_router.dart';

import '../../ui/pages/cheer_add_page.dart';
import '../../ui/pages/cheer_detail_page.dart';
import '../../ui/pages/cheer_list_page.dart';
import '../../ui/pages/home_page.dart';
import '../../ui/pages/learning_status_page.dart';
import '../../ui/pages/test_answer_page.dart';
import '../../ui/pages/test_page.dart';
import '../../ui/pages/test_settings_page.dart';
import '../../ui/pages/word_add_page.dart';
import '../../ui/pages/word_detail_page.dart';
import '../../ui/pages/word_list_page.dart';

final routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/test-settings',
      builder: (context, state) => const TestSettingsPage(),
    ),
    GoRoute(
      path: '/test',
      builder: (context, state) => const TestPage(),
    ),
    GoRoute(
      path: '/test-answer',
      builder: (context, state) => const TestAnswerPage(),
    ),
    GoRoute(
      path: '/words',
      builder: (context, state) => const WordListPage(),
    ),
    GoRoute(
      path: '/words/add',
      builder: (context, state) => const WordAddPage(),
    ),
    GoRoute(
      path: '/words/:id',
      builder: (context, state) => WordDetailPage(
        wordId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/cheers',
      builder: (context, state) => const CheerListPage(),
    ),
    GoRoute(
      path: '/cheers/add',
      builder: (context, state) => const CheerAddPage(),
    ),
    GoRoute(
      path: '/cheers/:id',
      builder: (context, state) => CheerDetailPage(
        cheerId: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: '/learning-status',
      builder: (context, state) => const LearningStatusPage(),
    ),
  ],
);
