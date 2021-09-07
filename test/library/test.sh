#!/bin/bash
set -e
set -x

git clone https://github.com/weaveworks-gitops-test/wego-library-test.git test/library/wego-library-test
cd test/library/wego-library-test
go get github.com/weaveworks/weave-gitops@v0.2.4
npm ci
npm run build
go build main.go
