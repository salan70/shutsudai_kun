import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabaseクライアントのインスタンス
final supabase = Supabase.instance.client;

/// Supabaseの初期化
Future<void> initializeSupabase() async {
  await Supabase.initialize(
    url: 'http://127.0.0.1:54321',
    anonKey: const String.fromEnvironment('SUPABASE_API_KEY_LOCAL'),
    debug: true,
  );
}
