#!/bin/bash

outdir='/KIMEL/tigrlab/scratch/doverton/s_spin/subjects/'
indir='/external/rprshnas01/hcp_downloads/Structural_Preprocessed'

while read subid; do
  unzip -d ${outdir} ${indir}/${subid}_3T_Structural_preproc.zip ${subid}/MNINonLinear/fsaverage_LR32k/${subid}.thickness.32k_fs_LR.dscalar.nii
done < HCP_subs.csv

while read subid; do
  wb_command -cifti-separate ${outdir}/${subid}/MNINonLinear/fsaverage_LR32k/${subid}.thickness.32k_fs_LR.dscalar.nii COLUMN -metric CORTEX_LEFT ${outdir}/${subid}/MNINonLinear/fsaverage_LR32k/${subid}.thickness.32k_fs_L.gii -metric CORTEX_RIGHT ${outdir}/${subid}/MNINonLinear/fsaverage_LR32k/${subid}.thickness.32k_fs_R.gii
  unzip -d ${outdir} ${indir}/${subid}_3T_Structural_preproc.zip ${subid}/MNINonLinear/fsaverage_LR32k/${subid}.thickness.32k_fs_LR.dscalar.nii
done < HCP_subs.csv
