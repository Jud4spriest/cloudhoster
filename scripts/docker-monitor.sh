#!/bin/bash

watch -n 2 "docker stats --no-stream --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}' | tee -a docker-usage.log"
