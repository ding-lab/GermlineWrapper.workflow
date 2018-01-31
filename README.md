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



## Workflow

Steps implemented:

0. Define BamMap.  May be created with a tool, or obtained from importGDC
1. gw.config.sh - this has per-project information.
   - will ultimately be moved to top level stack, for now is here
2. 1_make_batch.sh 
   - Processing in gw typically iterates over batches. Batch is composed of unique run names (also called sample names).
     Run `C3L-00004.WGS` would generate germline calls for the BAM file associated with case C3L-00004, experimental strategy WGS, normal sample
   - Define batch here based on all samples in BamMap file
2. 2_make_config.sh
 - Generates directory structure and configuration file - follow model of SomaticWrapper
3. scripts `evaluate_status.sh` and `run_step.sh` based on those in ther SomaticWrapper and importGDC project scripts
   - these will call on `evaluate_status.gw.sh` and `run_step.gw.sh` workflow scripts

# Additional documentation TODOs

Describe path nomenclature, what `_H` and `_C` mean

Describe BamMap
    - when creating your own, define what is important and what can be ignored
    - maybe can make a tool for creating a BamMap?  Note, should not assume that someone ran importGDC before running germline wrapper


