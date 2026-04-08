# python_template — PySide6

PySide6 を使ったデスクトップアプリ開発用テンプレート。

ベーステンプレート: `python-base` ブランチ

## 構成

- Python 3.12
- [PySide6](https://doc.qt.io/qtforpython/) — Qt6 Python バインディング
- [pytest-qt](https://pytest-qt.readthedocs.io/) — Qt ウィジェットのテスト
- [Black](https://black.readthedocs.io/) — コードフォーマッター
- [Ruff](https://docs.astral.sh/ruff/) — Linter / import整理
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

venv の作成と dev 依存のインストールを一括で行う。

### 3. venv を有効化（毎回）

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
python -m myapp.main

rem テスト（ヘッドレス）
set QT_QPA_PLATFORM=offscreen
pytest tests/ -v

rem Lint
ruff check src/ tests/

rem Format
black src/ tests/

rem Lint + import整理（自動修正）
ruff check --fix src/ tests/
```

## 環境変数

`.env.example` を `.env` にコピーして値を設定する。`.env` はgitignoreされている。
