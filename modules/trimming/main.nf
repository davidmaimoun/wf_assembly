nextflow.enable.dsl = 2

process TRIMMING {
    
    tag "Trimmomatic on $sample_id"
    publishDir "./samples/${sample_id}/trimmed", mode: 'copy'
    cpus 12

    input:
    tuple val(sample_id), path(reads)

    output:
    tuple val(sample_id), path('*')

    script:
    """
    trimmomatic PE -phred33 -threads ${task.cpus}\
    ${reads}\
    trim_paired_${reads[0]} trim_unpaired_${reads[0]}\
    trim_paired_${reads[1]} trim_unpaired_${reads[1]}\
    HEADCROP:20 SLIDINGWINDOW:4:20 LEADING:3 TRAILING:3 CROP:265 MINLEN:50
    """
}