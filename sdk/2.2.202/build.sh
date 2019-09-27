# ISSUE: Imagem 2.2.300 e a ultima da 2.2 nao gera os trx com a data (LogFileName_{ANO}-{mes}-{dia}_{hora}-{min}-{seg}-{ms})
# https://github.com/dotnet/cli/issues/12124

#ISSUE: Publish Code Coverage Results (Build Task) - Issue with TFS 2018
#https://github.com/microsoft/azure-pipelines-tasks/issues/11038

##-------------- RELEASE
export TIMEZONE="America/Sao_Paulo"
export SONAR_SCANNER_NUGET_VERSION="4.6.2"
export SONAR_SCANNER_BIN_VERSION="3.3.0.1492"
export SONAR_SCANNER_NETCORE_VERSION="netcoreapp2.1"
export REPORTGENERATOR_NUGET_VERSION="4.2.12"

export DOT_NET_CORE_SDK_VERSION="2.2.202"

echo "------------------------------------------------------"
echo "docker-compose build $DOT_NET_CORE_SDK_VERSION"
docker-compose -f ../docker-compose.build.yml build
echo "------------------------------------------------------"

echo
echo "------------------------------------------------------"
echo "docker push tjmt/dotnetcore:sdk-$DOT_NET_CORE_SDK_VERSION"
docker push tjmt/dotnetcore:sdk-$DOT_NET_CORE_SDK_VERSION
echo "------------------------------------------------------"