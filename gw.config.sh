PROJECT="TestData"

GWW_HOME="GermlineWrapper.workflow"  # Relative directory, since it is a submodule


# Data directory, relative to host
#DATAD_H="/gscmnt/gc2521/dinglab/mwyczalk/somatic-wrapper-data"  # MGI
DATAD_H="/Users/mwyczalk/Data/SomaticWrapper/data"  # epazote

# This is the analysis base.  
SCRIPTD_H="$DATAD_H/GermlineWrapper/$PROJECT"
SCRIPTD_C="/data/GermlineWrapper/$PROJECT"
CONFIGD_H="$SCRIPTD_H/config"

# CASES file is generated, BAMMAP_H may be uploaded or created
# We will want to refine this to be consistent with SomaticWrapper and ImportGDC
BAMMAP_H="$SCRIPTD_H/$PROJECT.BamMap.dat"
CASES="$SCRIPTD_H/$PROJECT.batch"


SWDATA_C="$SCRIPTD_C/data"  # where SomaticWrapper data is written, relative to continer
CONFIGD_C="$SCRIPTD_C/config"
