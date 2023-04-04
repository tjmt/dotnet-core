clear
export TIMEZONE="America/Sao_Paulo"
export SONAR_SCANNER_NUGET_VERSION="4.9.0"
export SONAR_SCANNER_BIN_VERSION="4.3.0.2102"
export SONAR_SCANNER_NETCORE_VERSION="netcoreapp3.0"
export REPORTGENERATOR_NUGET_VERSION="4.6.1"
export DOTNET_COVERAGE_NUGET_VERSION="17.6.9"
export OPENJDK_VERSION="default-jre"
export DOT_NET_CORE_SDK_VERSION="3.1"

echo "------------------------------------------------------"
echo "docker-compose build $DOT_NET_CORE_SDK_VERSION"
docker-compose -f ../docker-compose.build.yml build 
docker push tjmt/dotnetcore:sdk-$DOT_NET_CORE_SDK_VERSION
echo "------------------------------------------------------"