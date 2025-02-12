#! /bin/bash

echo "$@"
exec "$@" && echo "DONE" || echo "TRIED"