#!/bin/bash

reads=${1}

trimmomatic PE\
    -phred33\
    -threads 8\
    ${reads}\
    trim_paired_${reads[0]} trim_unpaired_${reads[0]}\
    trim_paired_${reads[1]} trim_unpaired_${reads[1]}\
    HEADCROP:20 SLIDINGWINDOW:4:20 LEADING:3 TRAILING:3 CROP:265 MINLEN:50
 