#!/bin/sh

set -eu

: ${CF_API?"missing required env: CF_API"}
: ${CF_USERNAME?"missing required env: CF_USERNAME"}
: ${CF_PASSWORD?"missing required env: CF_PASSWORD"}
: ${CF_ORGANIZATION?"missing required env: CF_ORGANIZATION"}
: ${CF_SPACE?"missing required env: CF_SPACE"}

cf api "$CF_API"
cf auth
cf target -o "$CF_ORGANIZATION" -s "$CF_SPACE"

exec cf push -f "$INPUT_MANIFEST" -p "$INPUT_PATH"
