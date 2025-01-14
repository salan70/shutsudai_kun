# Supabase プロジェクトのセットアップ

## 前提条件

以下がインストールされていることを前提とします。

- [Supabase CLI](https://supabase.com/docs/guides/cli)
- Docker Desktop

## DB について

スキーマ情報は [migrations/20240000000000_create_tables.sql](./migrations/20240000000000_create_tables.sql) を参照してください。

## 開発用コマンド

### データベース管理

```sh
# Supabase を起動。（ Docker を起動している必要あり ）
supabase start

# Supabase を停止。
supabase stop

# DB のマイグレーションを実施。
supabase db reset
```

### データベースアクセス情報

クライアントで使用する際は、以下を使用する。

- Supabase URL: `http://127.0.0.1:54321`
- Supabase anon key: `supabase start` 実行時に表示される
