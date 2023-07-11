nextflow.enable.dsl = 2

include { QC_READS } from './modules/qc_reads/main'
include { TRIMMING } from './modules/trimming/main'
include { ASSEMBLY } from './modules/assembly/main'

ch = Channel.fromFilePairs(params.input, checkIfExist:true)

workflow {
    TRIMMING(ch)
    QC_READS(TRIMMING.out)
    ASSEMBLY(TRIMMING.out)
}