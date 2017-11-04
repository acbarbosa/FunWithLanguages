SHELL := /bin/bash

build:
	docker build -t perl_base .

tests: build
	docker run --rm -v $(PWD):/src -w /src/Heapsort perl_base perl tests/algorithm_tests.pl
