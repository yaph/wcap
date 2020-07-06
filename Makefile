.PHONY: clean clean-test clean-pyc clean-build docs help


clean: clean-build clean-pyc clean-test ## remove all build, test, coverage and Python artifacts


clean-build: ## remove build artifacts
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +


clean-pyc: ## remove Python file artifacts
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +


clean-test: ## remove test and coverage artifacts
	rm -fr .tox/
	rm -f .coverage
	rm -fr htmlcov/
	rm -fr .pytest_cache


dist: clean ## builds source and wheel package
	python setup.py sdist
	python setup.py bdist_wheel
	ls -l dist


install: clean ## install the package to the active Python's site-packages
	python setup.py install


release: dist ## package and upload a release
	twine upload dist/*


test:
	wcap --dimensions 1500x1100 --wait 5 https://ukealong.com/key/c/ img/c.png
	wcap --dimensions 1500x1100 https://ukealong.com/key/d/ img/d.png
	wcap https://ukealong.com/key/e/ img/e.png
