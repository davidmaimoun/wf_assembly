#!/bin/bash

reads=${1}
cpus=${2}

/home/user1/FastQC/fastqc -q ${reads} -t ${cpus}