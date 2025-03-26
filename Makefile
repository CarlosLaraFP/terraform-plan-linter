PLAN_OUT=tfplan.binary
PLAN_JSON=tf-plan.json

#.PHONY: plan lint test clean

plan:
	cd terraform && terraform init -input=false
	cd terraform && terraform plan -json -out=$(PLAN_JSON)
	cat terraform/$(PLAN_JSON)

lint:
	go run main.go --file terraform/$(PLAN_JSON)

test:
	go test ./... -v

clean:
	rm -f terraform/$(PLAN_JSON)
	rm -f terraform/$(PLAN_OUT)
