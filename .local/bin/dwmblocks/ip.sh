#!/bin/sh

echo $(ip route get 1 2> /dev/null | awk '{print $(NF-2); exit}')
