AWS_STACK_NAME=aws-lambda-sample-golang

.PHONY: cloud-build
cloud-build:
	sam build

.PHONY: cloud-deploy
cloud-deploy: cloud-build
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

.PHONY: cloud-destroy
cloud-destroy:
	sam delete --stack-name ${AWS_STACK_NAME}

.PHONY: cloud-traces
cloud-traces:
	sam traces --stack-name ${AWS_STACK_NAME}

.PHONY: cloud-logs
cloud-logs:
	sam logs --stack-name ${AWS_STACK_NAME}

.PHONY: cdktf-deploy
cdktf-deploy:
	cd infra-cdktf
	cdktf deploy

.PHONY: cdktf-destroy
cdktf-destroy
	cd infra-cdktf
	cdktf destroy
