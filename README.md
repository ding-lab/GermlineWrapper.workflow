# GermlineWrapper Workflow

TODO: move ../germlinewrapper into . as a submodule

Scripts for configuring GermlineWrapper instances and starting them on Docker

Based on 

* /Users/mwyczalk/Data/SomaticWrapper/SomaticWrapper.CPTAC3.b1/SomaticWrapper.workflow
* /Users/mwyczalk/Data/CPTAC3/importGDC.CPTAC3.b1

## Architecture 

GermlineWrapper is implemented with a three layer model:

* GermlineWrapper is the core algorithm.  Run inside of docker container
* GermlineWrapper.workflow provides simple scripts to configure GermlineWrapper and execute it in a docker environment
* GermlineWrapper.project defines the specific project, for instance, CPTAC3.b2.

GermlineWrapper workflow will be developed to run on a standard Docker environment.  In particular,
support for MGI will not be provided.

Currently, workflow and project layers are combined in the same directory

## Test Implementation

Preliminary implementation in this project will be to test the StrelkaTest dataset which is generated
by SomaticWrapper.  BAM files as well as reference can be found here:
`/Users/mwyczalk/Data/SomaticWrapper/data/S_StrelkaTestData`

Sample configuration file:
`/Users/mwyczalk/Data/SomaticWrapper/SomaticWrapper.CPTAC3.b1/SomaticWrapper.workflow/somaticwrapper/image.setup/S_StrelkaDemoSetup/4_make_input_config.sh`

Tumor: /Users/mwyczalk/Data/SomaticWrapper/data/data/SWtest/SWtest.T.bam
Normal: /Users/mwyczalk/Data/SomaticWrapper/data/data/SWtest/SWtest.N.bam
Reference: /Users/mwyczalk/Data/SomaticWrapper/data/S_StrelkaTestData/demo20.fa

## Workflow

Steps implemented:

1. gw.config.sh - this has per-project information.
   - Define BamMap file.  This can be obtained from importGDC or created with `create_bam_map.sh`
2. 1_make_batch.sh 
   - Processing in gw typically iterates over batches. Batch is composed of unique run names (also called sample names).
     Run `C3L-00004.WGS` would generate germline calls for the BAM file associated with case C3L-00004, experimental strategy WGS, normal sample
   - Define batch here based on all samples in BamMap file
2. 2_make_config.sh
 - Generates directory structure and configuration file - follow model of SomaticWrapper
3. scripts `evaluate_status.sh` and `run_step.sh` based on those in ther SomaticWrapper and importGDC project scripts
   - these will call on `evaluate_status.gw.sh` and `run_step.gw.sh` workflow scripts

# Additional documentation TODOs

## Path nomenclature

Names like `CONFIGD_H` and `CONFIGD_C` (defined in `gw.config.sh`) refer to paths relative to host and container directories, respectively.
When a container runs, the directory defined by `DATD_H` is mapped to its `/data` directory.  


## BamMap

* when creating your own, define what is important and what can be ignored
* maybe can make a tool for creating a BamMap?  Note, should not assume that someone ran importGDC before running germline wrapper


