include helpers/common.mk

.PHONY: build-test-image
build-test-image:
	cd helpers/helm-tester && \
	for i in {1..5}; do docker build -t helm-tester . && break || sleep 15; done
