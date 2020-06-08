VENV := .venv
ACTIVATE := . $(VENV)/bin/activate
REQUIREMENTS := .requirements

.PHONY: start
start: $(REQUIREMENTS)
	$(ACTIVATE) && exec jupyter notebook

$(REQUIREMENTS): requirements.txt | $(VENV)
	$(ACTIVATE) && pip install --upgrade pip setuptools
	$(ACTIVATE) && pip install --upgrade -r requirements.txt && touch $(REQUIREMENTS)

$(VENV):
	python3 -m venv $@

.PHONY: clean
clean: $(VENV)
	rm -f $(REQUIREMENTS)
	rm -rf $(VENV)
