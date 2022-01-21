
image:
	-docker rm jana2_benchmarking
	docker build -f Dockerfile -t jana2_benchmarking .

image-nc:
	-docker rm jana2_benchmarking
	docker build --no-cache -f Dockerfile -t jana2_benchmarking .

push:
	docker tag jana2_benchmarking nbrei/jana2-benchmarking
	docker push nbrei/jana2-benchmarking

run:
	-docker rm jana2_benchmarking_container
	docker run -it \
		--mount type=bind,source="$(PWD)"/data,target=/app/data \
		--name jana2_benchmarking_container \
		jana2_benchmarking

shell:
	docker exec -it jana2_benchmarking_container /bin/bash

