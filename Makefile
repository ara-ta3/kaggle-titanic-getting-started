PYTHON3=$(shell which python3)
ENV_DIR=env
requirements=requirements.txt
csvs=train.csv test.csv gender_submission.csv

jupyter: setup
	source $(ENV_DIR)/bin/activate && jupyter notebook

setup: $(csvs) install
	@echo login and download csvs

install: $(requirements) venv
	source $(ENV_DIR)/bin/activate && pip install -r $<

venv:
	$(PYTHON3) -m venv $(ENV_DIR)

$(csvs):
	@echo https://www.kaggle.com/c/titanic/download/$@

