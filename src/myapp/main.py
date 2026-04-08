from fastapi import FastAPI

from myapp.routers import health

app = FastAPI(title="myapp", version="0.1.0")

app.include_router(health.router)


if __name__ == "__main__":
    import uvicorn

    uvicorn.run("myapp.main:app", host="0.0.0.0", port=8000, reload=True)
