#!/bin/bash

echo "INPUT_APOLLO_KEY=$INPUT_APOLLO_KEY"
echo "INPUT_APOLLO_APP_GRAPH_REF=$INPUT_APOLLO_APP_GRAPH_REF"
echo "INPUT_SCHEMA_PATH=$INPUT_SCHEMA_PATH"

if [[ -z "$INPUT_APOLLO_KEY" || -z "$INPUT_APOLLO_APP_GRAPH_REF" || -z "$INPUT_SCHEMA_PATH" ]]; 
then
    echo "input be required"
    exit 1
else
    echo "ok"
    APOLLO_KEY=$INPUT_APOLLO_KEY rover graph check $INPUT_APOLLO_APP_GRAPH_REF --schema $INPUT_SCHEMA_PATH --format json
    APOLLO_KEY=$INPUT_APOLLO_KEY rover graph publish $INPUT_APOLLO_APP_GRAPH_REF --schema $INPUT_SCHEMA_PATH
fi
