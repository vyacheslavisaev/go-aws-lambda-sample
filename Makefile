AWS_STACK_NAME=aws-lambda-sample-golang
# TOP_TARGETS := build
# SUBDIRS := my-function

# $(TOPTARGETS): $(SUBDIRS)
# $(SUBDIRS):
# 	$(MAKE) -C $@ $(MAKECMDGOALS)

# .PHONY: $(TOP_TARGETS) $(SUBDIRS)

.Phony: build
build:
	sam build

.Phony: deploy
deploy: build
	sam deploy \
 		--stack-name  ${AWS_STACK_NAME}\
  		--capabilities CAPABILITY_IAM \
   		--resolve-s3

.Phony: cloud-test
cloud-test:
	./bin/cloud-test.sh

.Phony: cloud-watch
cloud-watch:
	sam sync --stack-name ${AWS_STACK_NAME} --watch

.Phony: cloud-destroy
cloud-destroy:
	sam delete --stack-name ${AWS_STACK_NAME}

.Phony: cloud-traces
cloud-traces:
	sam traces --stack-name ${AWS_STACK_NAME}

.Phony: cloud-logs
cloud-logs:
	sam logs --stack-name ${AWS_STACK_NAME}