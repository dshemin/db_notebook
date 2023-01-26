SHELL := /bin/bash

VENV = venv
VENV_BIN = $(VENV)/bin

PIP := $(VENV_BIN)/pip
JUPYTER := $(VENV_BIN)/jupyter
JUPYTER_LAB := $(VENV_BIN)/jupyter-lab

deps: $(VENV_BIN)/activate
	$(PIP) install -r requirements.txt

$(VENV_BIN)/activate:
	virtualenv $(VENV)

run: deps
	docker compose up -d
	$(JUPYTER_LAB) --config ./config/jupyter_lab_config.py
	docker compose down

setup: deps
	$(JUPYTER) labextension install jupyterlab_templates
