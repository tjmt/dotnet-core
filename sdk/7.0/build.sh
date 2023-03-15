clear
export TIMEZONE="America/Sao_Paulo"
export SONAR_SCANNER_NUGET_VERSION="5.12.0"
export SONAR_SCANNER_BIN_VERSION="5.12.0"
export SONAR_SCANNER_NETCORE_VERSION="net5.0"
export REPORTGENERATOR_NUGET_VERSION="5.1.19"
export OPENJDK_VERSION="default-jre"
export DOT_NET_CORE_SDK_VERSION="7.0"

echo "------------------------------------------------------"
echo "docker-compose build $DOT_NET_CORE_SDK_VERSION"
docker-compose -f ../docker-compose.build.yml build
docker push tjmt/dotnetcore:sdk-$DOT_NET_CORE_SDK_VERSION
echo "------------------------------------------------------"
