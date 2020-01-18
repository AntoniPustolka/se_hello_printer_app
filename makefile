.PHONY: test

deps:
	pip install -r requirements.txt
	pip install -r test_requirements.txt

test:
	PYTHONPATH=. py.test  --verbose -s

run:
	PYTHONPATH=. FLASK_APP=hello_world flask run

lint:
	flake8 hello_world test

USERNAME=antonipustolka
TAG=$(USERNAME)/hello-world-printer

docker_push: docker_build
    @docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
    docker tag hello-world-printer $(TAG); \
    docker push $(TAG); \
    docker logout;
