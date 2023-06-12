### Non OLM based operator e2e kuttl test

`run-non-olm-kuttl-test.sh` is a bash script utility, that can be used to run the end to end test for Openshift GitOps Operator without using the `Operator Lifecycle Manager (OLM)`. 

### Usage

The `install-gitops-operator.sh` script needs to be run with arguments for directories that are not needed for the nightly operator. These directories will be removed before running the tests.
Example 

`./install-gitops-operator.sh 1-031_validate_toolchain 1-085_validate_dynamic_plugin_installation 1-038_validate_productized_images 1-051-validate_csv_permissions 1-073_validate_rhsso 1-077_validate_disable_dex_removed 1-090_validate_permissions`

