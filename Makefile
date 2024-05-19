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

build:
	rm -rf dist/
	rm -rf src/asyncgauth.egg-info
	python -m build

publish:
	twine check --strict dist/* && twine upload dist/*


.PHONY: install lock format check lint build publish
