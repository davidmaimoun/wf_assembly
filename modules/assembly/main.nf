nextflow.enable.dsl = 2

process ASSEMBLY {

    tag "Assembly on $sample_id"
    publishDir "./samples/${sample_id}/assembly", mode: 'copy'
    cpus 20

    input:
    tuple val(sample_id), path(reads)

    output:
    path '*'

    script:
    """
    spades.py -1 ${reads[0]} -2 ${reads[1]} -t ${task.cpus} \
    -m 200 --cov-cutoff auto -o ./samples/${sample_id}/assembly
    """
}