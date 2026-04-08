from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from myapp.routers import health

app = FastAPI(title="myapp", version="0.1.0")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(health.router)


if __name__ == "__main__":
    import uvicorn

    uvicorn.run("myapp.main:app", host="0.0.0.0", port=8000, reload=True)
