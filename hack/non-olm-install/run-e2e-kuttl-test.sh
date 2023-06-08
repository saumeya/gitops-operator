#!/usr/bin/env bash

export NON_OLM="true"

WORKING_DIR=../..
sequential_suite=$WORKING_DIR/test/openshift/e2e/sequential/
parallel_suite=$WORKING_DIR/test/openshift/e2e/parallel/

# Check if any argument is provided
if [ $# -eq 0 ]; then
    echo "No directory name provided, please add directory names as arguments while running the script"
fi    

# to run nightly tests, add the following files as params
# 1-031_validate_toolchain
# 1-085_validate_dynamic_plugin_installation
# 1-038_validate_productized_images
# 1-051-validate_csv_permissions
# 1-073_validate_rhsso
# 1-077_validate_disable_dex_removed
# 1-090_validate_permissions


for dir in "$@"; do
  if [ -d "$sequential_suite/$dir" ]; then
    echo "Deleting directory $dir"
    rm -rf "$sequential_suite/$dir"
  elif [ -d "$parallel_suite/$dir" ]; then
    echo "Deleting directory $dir"
    rm -rf "$parallel_suite/$dir"  
  else
    echo "Directory $dir does not exist"
  fi
done

#replace the namespace for assert in test file

sed -i 's/openshift-operators/gitops-operator-system/g' $sequential_suite/1-018_validate_disable_default_instance/02-assert.yaml \
  $sequential_suite/1-035_validate_argocd_secret_repopulate/04-check_controller_pod_status.yaml

script="$WORKING_DIR/scripts/run-kuttl-tests.sh"

# Check if the file exists before executing it
if [ -e "$script" ]; then
    chmod +x "$script"
    # Execute the script here
    source "$script" sequential
    source "$script" parallel
else
    echo "ERROR: Script file '$script' not found."
fi
