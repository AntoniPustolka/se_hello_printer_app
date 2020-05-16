SERVICE_NAME=hello_world_printer
DOCKER_IMG_NAME=$(SERVICE_NAME)
.PHONY: test
.DEFAULT_GOAL := test
# Tu pozostałe powinny się znaleźć targety z poprzednich ćwiczeń
# test, run, lint
docker_build:
      docker build -t $(DOCKER_IMG_NAME).

docker_run: docker_build
      docker run \
      --name $(SERVICE_NAME)-dev \
      -p 5000:5000 \
      -d $(DOCKER_IMG_NAME)
docker_stop:
      docker stop $(SERVICE_NAME)-dev

# Zastąp wsbtester1 swoim użytkownikiem hub.docker.com
USERNAME=AntoniPustolka
# tag z informacją, gdzie umieścić naszego docker-a na hub.docker.com

TAG=$(USERNAME)/$(DOCKER_IMG_NAME)
docker_push: docker_build
	    @docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
      docker tag $(DOCKER_IMG_NAME) $(TAG); \
      docker push $(TAG); \
      docker logout;
