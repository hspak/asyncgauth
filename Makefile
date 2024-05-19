install:
	uv pip install -r requirements.txt

lock:
	uv pip freeze | uv pip compile - -o requirements.txt

format:
	ruff format src

check:
	ruff check src

typecheck:
	pyright

lint: format check typecheck


.PHONY: install lock format check lint
