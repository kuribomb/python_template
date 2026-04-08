# python_template — Svelte フルスタック

FastAPI バックエンド + SvelteKit フロントエンドの構成テンプレート。

ベーステンプレート: `python-base` ブランチ

## 構成

### バックエンド（Python）

- Python 3.12
- [FastAPI](https://fastapi.tiangolo.com/) — Web フレームワーク
- [uvicorn](https://www.uvicorn.org/) — ASGI サーバー
- [httpx](https://www.python-httpx.org/) — テスト用 HTTP クライアント
- [Black](https://black.readthedocs.io/) — コードフォーマッター
- [Ruff](https://docs.astral.sh/ruff/) — Linter / import整理
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
rem バックエンド開発サーバー（ターミナル1）
uvicorn myapp.main:app --reload

rem フロントエンド開発サーバー（ターミナル2）
cd frontend
npm run dev

rem Lint
ruff check src/ tests/

rem Format
black src/ tests/

rem Lint + import整理（自動修正）
ruff check --fix src/ tests/

rem テスト
pytest tests/ -v
```

バックエンド: `http://localhost:8000/docs`
フロントエンド: `http://localhost:5173`

## 環境変数

`.env.example` を `.env` にコピーして値を設定する。`.env` はgitignoreされている。
