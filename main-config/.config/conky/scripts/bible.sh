#!/bin/bash

teste=$(pybible --qotd -r | sed -e "s/.\{60\}/&\n/g")
echo "$teste" 
