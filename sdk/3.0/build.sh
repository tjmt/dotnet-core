export SONAR_SCANNER_NUGET_VERSION="4.6.2"
export SONAR_SCANNER_BIN_VERSION="3.3.0.1492"
export SONAR_SCANNER_NETCORE_VERSION="netcoreapp2.1"
export REPORTGENERATOR_NUGET_VERSION="4.2.12"
export DOT_NET_CORE_SDK_VERSION="3.0"

echo "------------------------------------------------------"
echo "docker-compose build $DOT_NET_CORE_SDK_VERSION"
docker-compose -f ../docker-compose.build.yml build
echo "------------------------------------------------------"

echo
echo "------------------------------------------------------"
echo "docker push tjmt/dotnetcore:sdk-$DOT_NET_CORE_SDK_VERSION"
docker push tjmt/dotnetcore:sdk-$DOT_NET_CORE_SDK_VERSION
echo "------------------------------------------------------"