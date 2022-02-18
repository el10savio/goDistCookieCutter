package main

import (
	"net/http"
	"os"

	// Add your repo's handlers
	"./handlers"

	log "github.com/sirupsen/logrus"
)

const (
	// PORT defines the {{ cookiecutter.project_repo }}
	// node server port
	PORT = "{{ cookiecutter.project_port }}"
)

func init() {
	log.SetOutput(os.Stdout)
	log.SetLevel(log.DebugLevel)
}

func main() {
	r := handlers.Router()

	log.WithFields(log.Fields{
		"port": PORT,
	}).Info("started {{ cookiecutter.project_repo }} node server")

	http.ListenAndServe(":"+PORT, r)
}
