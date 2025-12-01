#!/bin/sh

exec "${CODEQL_EXTRACTOR_DOCKERFILE_ROOT}/tools/${CODEQL_PLATFORM}/dockerfile-extractor" autobuild
