IMAGE_NAME = web
CONTAINER_NAME = web-app
build:
	docker build -t ${IMAGE_NAME}:latest .

run:
	docker run --name ${CONTAINER_NAME} -d -p 9090:80 ${IMAGE_NAME}:latest

update: 
	docker tag ${IMAGE_NAME}:latest ${IMAGE_NAME}:toDelete
	$(MAKE) build
	ifeq ($(docker ps -aqf "name=web-app"), )
		docker stop ${CONTAINER_NAME} 
		docker rm ${CONTAINER_NAME}
	endif
	$(MAKE) run
	yes | docker image prune -a # remove all images which are not used by existing containers
	@echo "DONE"



