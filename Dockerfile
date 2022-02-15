FROM golang:alpine AS builder

RUN apk update && apk add --no-cache git 

RUN mkdir /{{ cookiecutter.project_binary }}

WORKDIR /{{ cookiecutter.project_binary }}

ENV GO111MODULE=on

COPY go.mod go.sum ./

RUN go mod graph | awk '{if ($1 !~ "@") print $2}' | xargs go get

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -v -a -installsuffix cgo -o /go/bin/{{ cookiecutter.project_binary }}


FROM scratch

COPY --from=builder /go/bin/{{ cookiecutter.project_binary }} /go/bin/{{ cookiecutter.project_binary }}

ENTRYPOINT ["/go/bin/{{ cookiecutter.project_binary }}"]

EXPOSE 8080
