IMAGE_NAME ?= boomfish/lambda-serverless
LANG ?= nodejs8.10

build:
	cd $(LANG) && docker build --pull -t $(IMAGE_NAME):$(LANG) .

pull:
	docker pull $(IMAGE_NAME):$(LANG)

shell:
	docker run --rm -it -v $(PWD):/opt/app $(IMAGE_NAME):$(LANG) bash

push:
	git push origin HEAD:refs/heads/$(LANG)
