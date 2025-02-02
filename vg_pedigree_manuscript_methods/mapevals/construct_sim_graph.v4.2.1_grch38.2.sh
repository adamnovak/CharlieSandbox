#!/bin/bash
cd /data/Udpbinfo/usr/markellocj/vg_trio_methods/redo_mapevals
module load python/3.7 singularity
source /data/markellocj/test_toil_vg_run/toil_vg_tools/toilvg_venv/bin/activate
WORK_DIR="/data/Udpbinfo/usr/markellocj/vg_trio_methods/redo_mapevals/HG002_construct_haplotype_sim_graph_workdir"
rm -fr ${WORK_DIR}/vg-construct-v4.2.1_grch38-outstore_2
rm -fr ${WORK_DIR}/tmp-vg-construct-v4.2.1_grch38_2
mkdir -p ${WORK_DIR}/vg-construct-v4.2.1_grch38-outstore_2
mkdir -p ${WORK_DIR}/tmp-vg-construct-v4.2.1_grch38_2
toil clean ${WORK_DIR}/vg-construct-v4.2.1_grch38-jobstore_2

toil-vg construct \
${WORK_DIR}/vg-construct-v4.2.1_grch38-jobstore_2 \
${WORK_DIR}/vg-construct-v4.2.1_grch38-outstore_2 \
--batchSystem singleMachine \
--container Singularity \
--vg_docker quay.io/vgteam/vg:ci-2890-655a9622c3d60e87f14b88d943fbd8554214a975 \
--realTimeLogging \
--logInfo \
--workDir ${WORK_DIR}/tmp-vg-construct-v4.2.1_grch38_2 \
--cleanWorkDir onSuccess \
--fasta /data/markellocj/fasta_references/grch38_reference/GCA_000001405.15_GRCh38_no_alt_plus_hs38d1_analysis_set.compact_decoys.fna.gz \
--out_name hg002_sample_grch38 \
--logFile construct_baseline.v4.2.1_grch38.2.log \
--xg_index --gbwt_index \
--force_phasing True \
--sample_graph HG002 \
--merge_graphs \
--keep_vcfs \
--fasta_regions \
--vcf /data/markellocj/benchmark_data/HG002_cohort/HG002_GRCh38_1_22_v4.2.1_benchmark_phased_MHCassembly_StrandSeqANDTrio.no_asterisk.vcf.gz \
--vcf_phasing /data/markellocj/benchmark_data/HG002_cohort/HG002_GRCh38_1_22_v4.2.1_benchmark_phased_MHCassembly_StrandSeqANDTrio.no_asterisk.vcf.gz \
--statePollingWait 120 \
--rescueJobsFrequency 120

