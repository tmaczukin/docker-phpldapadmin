ts:=$(shell date '+%Y%m%d%H%M%S')
name=phpldapadmin
vendor=tmaczukin
tag=0.1
imageName=$(vendor)/$(name)

build: Dockerfile
	docker build --rm -t $(imageName):$(tag) .
	docker tag $(imageName):$(tag) $(imageName):latest

ubuild: update build

update: Dockerfile
	sed -i 's/# update_[0-9]*/# update_$(ts)/' Dockerfile

