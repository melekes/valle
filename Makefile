docker_build:
	docker build -t valle .

docker_test:
	docker run -it --rm -v "$(PWD)":/usr/src/lib valle bundle exec rake

.PHONY: docker_build docker_test
