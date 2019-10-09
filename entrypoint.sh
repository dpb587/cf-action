#!/bin/sh

set -eu

: ${INPUT_API?"missing required env: INPUT_API"}
: ${INPUT_USERNAME?"missing required env: INPUT_USERNAME"}
: ${INPUT_PASSWORD?"missing required env: INPUT_PASSWORD"}
: ${INPUT_ORGANIZATION?"missing required env: INPUT_ORGANIZATION"}
: ${INPUT_SPACE?"missing required env: INPUT_SPACE"}

cf api "$INPUT_API"

export CF_USERNAME="${INPUT_USERNAME}"
export CF_PASSWORD="${INPUT_PASSWORD}"
cf auth

cf target -o "$INPUT_ORGANIZATION" -s "$INPUT_SPACE"
