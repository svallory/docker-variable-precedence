#!/bin/sh

mkdir code; cd code

flox init >/dev/null
flox install gum >/dev/null

vars="$(cat <<EOF
Variable,Value
HELLO_ENV_VARIABLE,$HELLO_ENV_VARIABLE
HELLO_BUILD_ARG,$HELLO_BUILD_ARG
HELLO_MESSAGE,$HELLO_MESSAGE
HELLO_COMPOSE_ENV,$HELLO_COMPOSE_ENV
COMPOSE_ONLY,$COMPOSE_ONLY
COMPOSE_PASS,$COMPOSE_PASS
COMPOSE_PASS_VAL,${COMPOSE_PASS_VAL:-default_value}
COMPOSE_PASS_NO_VAL,$COMPOSE_PASS_NO_VAL
__UNKNOWN_VAR__,$__UNKNOWN_VAR__
EOF
)"

# Display the CSV content as a table using gum table
flox activate --  \
  echo "$vars" '|' \
  gum table -p -b rounded
