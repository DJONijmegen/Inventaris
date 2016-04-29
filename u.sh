#!/bin/sh

printf "db.parts.update( { \"_id\" : ObjectId(\"%s\") }, { \"\$set\": { \"location\": %d } } );\n" "$1" "$2"
