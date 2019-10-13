#!/bin/sh

update_golang() {
 REQUIRED=go1.13.1
 DIRNAME=$(dirname $(which go))
 VERISON=$(go version | cut -f3 -d' ')
 if [ "${REQUIRED}" != "${VERISON}" ] ; then
   go get golang.org/dl/${REQUIRED}
   ${REQUIRED} download
   sudo mv ${DIRNAME}/go ${DIRNAME}/${VERISON}
   sudo cp $(wich ${REQUIRED}) ${DIRNAME}/go
 fi
}

which task >/dev/null 2>&1 || go get -u -v github.com/go-task/task/cmd/task
