.PHONY: default
default:

.PHONY: provision
provision: deps
	ansible-playbook --diff -i inventory --private-key=$(KEY) --vault-password-file=$(VAULT_FILE) playbook.yml

.PHONY: clean
clean:
	rm -fr ./roles

.PHONY: deps
deps: clean
	mkdir -p ./roles
	ansible-galaxy install -v -r requirements.yml --force --roles-path ./roles
