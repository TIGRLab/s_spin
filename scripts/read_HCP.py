import nibabel as nib
import numpy as np
sublist = [line.strip() for line in open("HCP_subs.csv")]
basedir = "/KIMEL/tigrlab/scratch/doverton/s_spin/subjects/"
alldat = []
for sub in sublist:
    left_path = basedir + sub + "/MNINonLinear/fsaverage_LR32k/" + sub + ".thickness.32k_fs_L.gii"
    left_dat = nib.load(left_path).darrays[0].data
    alldat.append(left_dat)
np.savetxt("thickness_32k_l.csv", np.array(alldat), delimiter=",")
