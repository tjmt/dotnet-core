#--------------------------------------Imagem base --------------------------------------------#
# Configuração e instalação de ferramentas necessárias
#----------------------------------------------------------------------------------------------#
ARG DOT_NET_CORE_SDK_VERSION
FROM mcr.microsoft.com/dotnet/sdk:$DOT_NET_CORE_SDK_VERSION as base
ARG OPENJDK_VERSION
#--------------------------------------Instalar o java-----------------------------------------#
#Necessário para o sonarqube
#https://community.sonarsource.com/t/sonarscanner-fails-with-error-permission-denied/1897
#https://community.sonarsource.com/t/c-sonarscanner-net-core-version-permission-denied-error-in-docker/8354
RUN mkdir -p /usr/share/man/man1

RUN apt-get update && apt-get install -y $OPENJDK_VERSION
#----------------------------------------------------------------------------------------------#

ARG TimeZone
ARG SONAR_SCANNER_NUGET_VERSION
ARG SONAR_SCANNER_BIN_VERSION
ARG SONAR_SCANNER_NETCORE_VERSION
ARG REPORTGENERATOR_NUGET_VERSION

ENV RESULT_PATH="/TestResults/result/vsTest/"
ENV COVERAGE_PATH="/TestResults/codecoverage/"
ENV COVERAGE_REPORT_PATH="/TestResults/codecoverage/Report/"
#----------------------------------------------------------------------------------------------#

#--------------------------------------Configura o TimeZone------------------------------------#
RUN ln -snf /usr/share/zoneinfo/$TimeZone /etc/localtime && echo $TimeZone > /etc/timezone
#----------------------------------------------------------------------------------------------#

#--------------------------------------Configura o TLS Min Protocol Version para v1------------#
RUN sed -i 's/DEFAULT@SECLEVEL=2/DEFAULT@SECLEVEL=1/g' /etc/ssl/openssl.cnf
RUN sed -i 's/MinProtocol = TLSv1.2/MinProtocol = TLSv1/g' /etc/ssl/openssl.cnf
RUN sed -i 's/DEFAULT@SECLEVEL=2/DEFAULT@SECLEVEL=1/g' /usr/lib/ssl/openssl.cnf
RUN sed -i 's/MinProtocol = TLSv1.2/MinProtocol = TLSv1/g' /usr/lib/ssl/openssl.cnf
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
