clear
export TIMEZONE="America/Sao_Paulo"
export SONAR_SCANNER_NUGET_VERSION="4.7.1"
export SONAR_SCANNER_BIN_VERSION="4.1.0.1829"
export SONAR_SCANNER_NETCORE_VERSION="netcoreapp2.1"
export REPORTGENERATOR_NUGET_VERSION="4.3.3"
export OPENJDK_VERSION="default-jre"
export DOT_NET_CORE_SDK_VERSION="3.0.100"

echo "------------------------------------------------------"
echo "docker-compose build $DOT_NET_CORE_SDK_VERSION"
docker-compose -f ../docker-compose.build.yml build && docker push tjmt/dotnetcore:sdk-$DOT_NET_CORE_SDK_VERSION
echo "------------------------------------------------------"