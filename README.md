# python_template — Svelte フルスタック

FastAPI バックエンド + SvelteKit フロントエンドの構成テンプレート。

ベーステンプレート: `python-base` ブランチ

## 構成

### バックエンド（Python）

- Python 3.12
- [FastAPI](https://fastapi.tiangolo.com/) — Web フレームワーク
- [uvicorn](https://www.uvicorn.org/) — ASGI サーバー
- [httpx](https://www.python-httpx.org/) — テスト用 HTTP クライアント
- [uv](https://docs.astral.sh/uv/) — パッケージ / 仮想環境管理
- [Ruff](https://docs.astral.sh/ruff/) — Linter / Formatter / import整理
- [pytest](https://docs.pytest.org/) — テスト
- src-layout (`src/myapp/`)

### フロントエンド（SvelteKit）

- [SvelteKit](https://kit.svelte.dev/) — フルスタックフレームワーク
- TypeScript
- Vite

### ディレクトリ構成

```
src/myapp/          # Python API バックエンド
├── main.py         # FastAPI アプリ（CORS設定あり）
├── routers/        # APIRouter ごとにファイルを分割
└── models/         # Pydantic モデル
frontend/           # SvelteKit フロントエンド
├── src/
│   ├── lib/api.ts  # バックエンド API クライアント
│   └── routes/     # ページコンポーネント
└── package.json
```

## セットアップ

### 1. テンプレートから新しいリポジトリを作成

```bat
git clone --branch python/svelte --single-branch https://github.com/kuribomb/python_template.git my-project
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
rem バックエンド開発サーバー（ターミナル1）
uv run uvicorn myapp.main:app --reload

rem フロントエンド開発サーバー（ターミナル2）
cd frontend
npm run dev

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

rem テスト
uv run pytest tests/ -v
```

バックエンド: `http://localhost:8000/docs`
フロントエンド: `http://localhost:5173`

## 環境変数

`.env.example` を `.env` にコピーして値を設定する。`.env` はgitignoreされている。
