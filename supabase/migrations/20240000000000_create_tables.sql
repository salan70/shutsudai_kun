-- Create words table
CREATE TABLE IF NOT EXISTS words (
  id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  english text NOT NULL,
  japanese text NOT NULL,
  part_of_speech text NOT NULL,
  example_sentence text,
  example_word text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- Create word_comments table
CREATE TABLE IF NOT EXISTS word_comments (
  id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  word_id bigint NOT NULL REFERENCES words(id) ON DELETE CASCADE,
  user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  comment text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Create test_results table
CREATE TABLE IF NOT EXISTS test_results (
  id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  word_id bigint NOT NULL REFERENCES words(id) ON DELETE CASCADE,
  is_correct boolean NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Create cheer_messages table
CREATE TABLE IF NOT EXISTS cheer_messages (
  id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  message text NOT NULL,
  display_timing text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- Create user_settings table
CREATE TABLE IF NOT EXISTS user_settings (
  user_id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  word_color text,
  cheer_frequency integer DEFAULT 5,
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- Create indexes
CREATE INDEX IF NOT EXISTS words_english_idx ON words(english);
CREATE INDEX IF NOT EXISTS test_results_user_id_idx ON test_results(user_id);
CREATE INDEX IF NOT EXISTS test_results_word_id_idx ON test_results(word_id); 

-- テストデータの追加
INSERT INTO words (english, japanese, part_of_speech, example_sentence, example_word)
VALUES ('hello', 'こんにちは', 'interjection', 'Hello, how are you?', 'hello'); 