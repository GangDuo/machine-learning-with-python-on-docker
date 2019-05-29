#!/bin/bash
set -eo pipefail
shopt -s nullglob

pip install -r requirements.txt

exec "$@"
