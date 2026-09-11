# python_template — PySide6

PySide6 を使ったデスクトップアプリ開発用テンプレート。

ベーステンプレート: `python-base` ブランチ

## 構成

- Python 3.12
- [PySide6](https://doc.qt.io/qtforpython/) — Qt6 Python バインディング
- [pytest-qt](https://pytest-qt.readthedocs.io/) — Qt ウィジェットのテスト
- [uv](https://docs.astral.sh/uv/) — パッケージ / 仮想環境管理
- [Ruff](https://docs.astral.sh/ruff/) — Linter / Formatter / import整理
- [Pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.pylance) — 型チェック (standard)
- src-layout (`src/myapp/`)

### ディレクトリ構成

```
src/myapp/
├── main.py             # QApplication エントリポイント
└── ui/
    └── main_window.py  # QMainWindow サブクラス
```

## セットアップ

### 1. テンプレートから新しいリポジトリを作成

```bat
git clone --branch python/pyside6 --single-branch https://github.com/kuribomb/python_template.git my-project
cd my-project
rmdir /s /q .git
git init
git add .
git commit -m "Initial commit"
```

### 2. 環境構築（Windows）

```bat
setup.bat
```

`uv sync` を実行し、venv の作成と dev 依存のインストールを一括で行う。
uv が未インストールの場合は自動でインストールする。
Python 3.12 が無い場合も uv が自動でダウンロードする（`.python-version` で指定）。

### 3. コマンドの実行

venv を明示的に有効化しなくても `uv run` で直接実行できる。

```bat
uv run pytest
uv run ruff check .
```

明示的に有効化する場合は以下。

```bat
.venv\Scripts\activate.bat
```

### 4. VSCode で開く

```bat
code .
```

初回起動時に推奨拡張機能のインストールを促される。

### 5. パッケージ名を変更する

`src/myapp/` を `src/<your_package_name>/` にリネームし、以下を合わせて変更する。

- `pyproject.toml` の `name` と `known-first-party`
- `tests/test_main.py` の import

## よく使うコマンド

```bat
rem アプリ起動
uv run python -m myapp.main

rem テスト（ヘッドレス）
set QT_QPA_PLATFORM=offscreen
uv run pytest tests/ -v

rem 依存関係の同期（pyproject.toml変更後など）
uv sync

rem 依存パッケージの追加
uv add <package>
uv add --dev <package>

rem Lint
uv run ruff check src/ tests/

rem Format
uv run ruff format src/ tests/

rem Lint + import整理（自動修正）
uv run ruff check --fix src/ tests/
```

## 環境変数

`.env.example` を `.env` にコピーして値を設定する。`.env` はgitignoreされている。
