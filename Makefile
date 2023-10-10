AWS_STACK_NAME=aws-lambda-sample-golang

.PHONY: build
build:
	sam build

.PHONY: deploy
deploy: build
	sam deploy \
 		--stack-name  ${AWS_STACK_NAME}\
  		--capabilities CAPABILITY_IAM \
   		--resolve-s3

.PHONY: cloud-test
cloud-test:
	./bin/cloud-test.sh

.PHONY: cloud-watch
cloud-watch:
	sam sync --stack-name ${AWS_STACK_NAME} --watch

.PHONY: destroy
destroy:
	sam delete --stack-name ${AWS_STACK_NAME}

.PHONY: cloud-traces
cloud-traces:
	sam traces --stack-name ${AWS_STACK_NAME}

.PHONY: cloud-logs
cloud-logs:
	sam logs --stack-name ${AWS_STACK_NAME}