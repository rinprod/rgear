MASTER_VERSION := $(shell grep '^version = .*$$' pyproject.toml | awk '{print $$3}')
all: README.md

README.md: README.bashdown 
	bashdown README.bashdown > README.md

build:
	-rm -r ./dist/*
	poetry build

tidy:
	black rgear/
	pylint rgear/

test:
	python3 -m unittest

version:
	sed -i "s/^__version__ = .*$$/__version__ = \"$(MASTER_VERSION)\"/g" rgear/__init__.py

publish:
	poetry publish
