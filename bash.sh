
echo "hello"

test_path="test/openshift/e2e/parallel/1-090_validate_permissions"

if [ -d "$test_path" ]; then 
    echo "updating"
    sed -i 's/gitops-operator.v1.8.0/gitops-operator.v99.9.0/g' \
    "$test_path/01-assert.yaml" 
else 
    echo "file not present"
fi

