
{{ cookiecutter.project_repo }}-build:
	@echo "Building {{ cookiecutter.project_repo }} Docker Image"	
	DOCKER_BUILDKIT=1 docker build -t {{ cookiecutter.project_binary }} -f Dockerfile .

{{ cookiecutter.project_repo }}-run:
	@echo "Running Single {{ cookiecutter.project_repo }} Docker Container"
	docker run -p {{ cookiecutter.project_port }}:{{ cookiecutter.project_port }} -d {{ cookiecutter.project_binary }}

provision:
	@echo "Provisioning {{ cookiecutter.project_repo }} Cluster"	
	bash scripts/provision.sh 3

info:
	echo "{{ cookiecutter.project_repo }} Cluster Nodes"
	docker ps | grep '{{ cookiecutter.project_binary }}'
	docker network ls | grep {{ cookiecutter.project_binary }}_network

e2e:
	@echo "Running E2E Testing On {{ cookiecutter.project_repo }} Cluster"	
	bash scripts/tests.sh

clean:
	@echo "Cleaning {{ cookiecutter.project_repo }} Cluster"
	bash scripts/teardown.sh

build:
	@echo "Building {{ cookiecutter.project_repo }} Server"	
	go build -o bin/{{ cookiecutter.project_repo }} main.go

fmt:	
	@echo "go fmt {{ cookiecutter.project_repo }} Server"	
	go fmt ./...

vet:
	@echo "go vet {{ cookiecutter.project_repo }} Server"	
	go vet ./...

lint:
	@echo "go lint {{ cookiecutter.project_repo }} Server"	
	golint ./...

golanglintci:
	@echo "golanglintci {{ cookiecutter.project_repo }} Server"	
	docker run --rm -v $(shell pwd):/app -w /app golangci/golangci-lint:v1.42.1 golangci-lint run --out-format tab --enable-all

semgrep:
	@echo "semgrep {{ cookiecutter.project_repo }} Server"	
	docker run --rm -v "$(shell pwd):/src" returntocorp/semgrep --config=auto

lint-dockerfile:
	@echo "lint {{ cookiecutter.project_repo }} Dockerfile"	
	docker run --rm -i hadolint/hadolint < Dockerfile

test:
	@echo "Testing {{ cookiecutter.project_repo }} Server"	
	go test -v -race --cover ./...

shellcheck:
	@echo "shellcheck {{ cookiecutter.project_repo }} Scripts"
	shellcheck -f gcc scripts/*.sh

shfmt:
	@echo "shfmt {{ cookiecutter.project_repo }} Scripts"
	shfmt -i 2 -ci -w -l -bn scripts/*.sh

codespell:
	@echo "checking {{ cookiecutter.project_repo }} spellings"
	codespell
