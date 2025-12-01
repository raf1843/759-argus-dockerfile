#!/bin/sh

set -eu

exec "${CODEQL_EXTRACTOR_DOCKERFILE_ROOT}/tools/${CODEQL_PLATFORM}/dockerfile-extractor" extract \
	--file-list "$1" \
	--source-archive-dir "$CODEQL_EXTRACTOR_DOCKERFILE_SOURCE_ARCHIVE_DIR" \
	--output-dir "$CODEQL_EXTRACTOR_DOCKERFILE_TRAP_DIR"
