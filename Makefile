.PHONY: backend frontend install-frontend

backend:
	uvicorn myapp.main:app --reload

frontend:
	cd frontend && npm run dev

install-frontend:
	cd frontend && npm install

dev:
	@echo "Start each in a separate terminal:"
	@echo "  make backend"
	@echo "  make frontend"
