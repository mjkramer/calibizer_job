#!/usr/bin/env bash

infile=$(realpath $1)
outfile=$(realpath $2)

logdir=$SCRATCH/logs.calibizer/$SLURM_JOBID
mkdir -p "$logdir"

cd module0_flow

yamldir=module2_yamls/workflows

srun -o "$logdir"/slurm-%j.%t.out \
    python3 -m h5flow -c $yamldir/charge/charge_event_building.yaml \
    $yamldir/charge/charge_event_reconstruction.yaml \
    $yamldir/gen_all_resources.yaml \
    -i "$infile" \
    -o "$outfile"
