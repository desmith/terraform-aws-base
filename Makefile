STAGE ?= prod


all: test

init:
	terraform init -input=false -backend-config=vars/$(STAGE).tfbackend -reconfigure

clean:
	rm -rf tfplan tfplan.txt terraform.tfstate* .terraform

plan:
	terraform validate
	#terraform plan -out=tfplan --var-file=vars/$(STAGE).tfvars
	terraform plan -out=tfplan
	terraform show -no-color tfplan > tfplan.txt

test: clean
	make -C test

apply: plan
	terraform apply --auto-approve tfplan

validate:
	terraform validate

.PHONY: all apply clean plan test validate
