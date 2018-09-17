IMAGE_NAME ?= boomfish/lambda-serverless
TAG ?= nodejs8.10

build:
	cd $(TAG) && docker build --pull -t $(IMAGE_NAME):$(TAG) .

pull:
	docker pull $(IMAGE_NAME):$(TAG)

shell:
	docker run --rm -it -v $(PWD):/opt/app $(IMAGE_NAME):$(TAG) bash

tag:
	git push origin HEAD:refs/heads/$(TAG)
