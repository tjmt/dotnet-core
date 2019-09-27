#--------------------------------------Imagem base --------------------------------------------#
# Configuração e instalação de ferramentas necessárias
#----------------------------------------------------------------------------------------------#
ARG DOT_NET_CORE_SDK_VERSION
FROM mcr.microsoft.com/dotnet/core/sdk:$DOT_NET_CORE_SDK_VERSION as base

#--------------------------------------Instalar o java-----------------------------------------#
#Necessário para o sonarqube
#https://community.sonarsource.com/t/sonarscanner-fails-with-error-permission-denied/1897
#https://community.sonarsource.com/t/c-sonarscanner-net-core-version-permission-denied-error-in-docker/8354
#openjdk-8-jdk
RUN apt-get update && apt-get install -y openjdk-8-jre
#----------------------------------------------------------------------------------------------#

ARG TimeZone
ARG SONAR_SCANNER_NUGET_VERSION
ARG SONAR_SCANNER_BIN_VERSION
ARG SONAR_SCANNER_NETCORE_VERSION
ARG REPORTGENERATOR_NUGET_VERSION
ARG RESULT_PATH
ARG COVERAGE_PATH
ARG COVERAGE_REPORT_PATH
ENV RESULT_PATH=$RESULT_PATH
ENV COVERAGE_PATH=$COVERAGE_PATH
ENV COVERAGE_REPORT_PATH=$COVERAGE_REPORT_PATH
#----------------------------------------------------------------------------------------------#

#--------------------------------------Configura o TimeZone------------------------------------#
RUN ln -snf /usr/share/zoneinfo/$TimeZone /etc/localtime && echo $TimeZone > /etc/timezone
#----------------------------------------------------------------------------------------------#

#--------------------------------------Instalando ferramentas globalmente----------------------#
#https://www.nuget.org/packages/dotnet-sonarscanner/
#https://www.nuget.org/packages/dotnet-reportgenerator-globaltool/
RUN dotnet tool install --global dotnet-sonarscanner --version ${SONAR_SCANNER_NUGET_VERSION} && \
    dotnet tool install --global dotnet-reportgenerator-globaltool --version ${REPORTGENERATOR_NUGET_VERSION}
ENV PATH "$PATH:/root/.dotnet/tools/"
RUN chmod +x /root/.dotnet/tools/.store/dotnet-sonarscanner/${SONAR_SCANNER_NUGET_VERSION}/dotnet-sonarscanner/${SONAR_SCANNER_NUGET_VERSION}/tools/${SONAR_SCANNER_NETCORE_VERSION}/any/sonar-scanner-${SONAR_SCANNER_BIN_VERSION}/bin/sonar-scanner
#----------------------------------------------------------------------------------------------#

#--------------------------------------Copiando arquivos sh------------------------------------#
COPY /entrypoint/ /entrypoint/
RUN chmod +x /entrypoint/entrypoint.sh \
            /entrypoint/wait-for-it.sh            
#----------------------------------------------------------------------------------------------#