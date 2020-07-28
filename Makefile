PJTDIR := $(dir $(lastword $(MAKEFILE_LIST)))

.PHONY: build
build:
	@ docker-compose -f docker-compose.test.yml build

.PHONY: edit
edit:
	@ docker-compose -f docker-compose.test.yml run sut dgoss edit goss sleep infinity

.PHONY: test
test:
	@ docker-compose -f docker-compose.test.yml run sut

.PHONY: clean
clean:
	@ docker-compose -f docker-compose.test.yml down
