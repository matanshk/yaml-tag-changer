#!/bin/bash

filename=${INPUT_FILENAME}
tag=${INPUT_TAG}
component=${INPUT_COMPONENT_NAME}

echo "The new tag for $component wil be: $tag"

patch "$filename" <<< $(diff -U0 -w -b --ignore-blank-lines $filename <(yq eval ".$component.image.tag = \"$tag\"" $filename))
