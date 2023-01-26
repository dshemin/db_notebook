SHELL := /bin/bash

VENV = venv
VENV_BIN = $(VENV)/bin
PIP := $(VENV_BIN)/pip

deps: $(VENV_BIN)/activate
	$(PIP) install -r requirements.txt

$(VENV_BIN)/activate:
	virtualenv $(VENV)

run: deps
	docker compose up -d
	jupyter-lab --config ./config/jupyter_lab_config.py
	docker compose down

setup: deps
	jupyter labextension install jupyterlab_templates
