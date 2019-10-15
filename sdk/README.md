# About This Image
Imagem customizada, herdada do `mcr.microsoft.com/dotnet/core/sdk`

Tem como objetivo conter todas as ferramentas necessárias para compilar, publicar, executar testes, coletar métricas e analisar o código pelo sonarqube.

### Ferramentas instaladas:
- openjdk-8-jre (*Necessário para o sonarqube*)
- [dotnet-sonarscanner](https://www.nuget.org/packages/dotnet-sonarscanner/)
- [dotnet-reportgenerator](https://www.nuget.org/packages/dotnet-reportgenerator-globaltool/)