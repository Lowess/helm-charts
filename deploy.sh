export CR_PACKAGE_PATH=".cr-release-packages"
export CR_INDEX_PATH=".cr-index"

export CR_OWNER=Lowess
export CR_GIT_REPO=helm-charts

# Cleanup Chart releaser directory
rm -rf ${CR_PACKAGE_PATH}; mkdir -p ${CR_PACKAGE_PATH}
rm -rf ${CR_INDEX_PATH}; mkdir -p ${CR_INDEX_PATH}

if [ -z "${CR_TOKEN}" ]; then
    echo "Missing CR_TOKEN to interract with Github"
    exit 1
fi

if [ -z "${1}" ]; then
    echo "No argument supplied, provide a chart name to release"
    exit 1
else
  echo "$1"
fi

# Update charts dependencies
for CHART in ${1//,/ }; do
    helm dependency update "charts/${CHART}";
    helm package "charts/$CHART" --destination "${CR_PACKAGE_PATH}";
done

cr upload --skip-existing
cr index
