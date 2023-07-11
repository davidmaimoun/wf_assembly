nextflow.enable.dsl = 2

process QC_READS {

    tag "FastQC on $sample_id"
    publishDir "./samples/${sample_id}/qc_reads", mode: 'copy'
    cpus 4

    input:
    tuple val(sample_id), path(reads)

    output:
    path "*"

    script:
    """
    /home/user1/FastQC/fastqc -q ${reads} -t ${task.cpus}
    """
}

