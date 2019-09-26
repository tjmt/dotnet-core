ARG DOT_NET_CORE_ASPNET_VERSION
FROM mcr.microsoft.com/dotnet/core/aspnet:${DOT_NET_CORE_ASPNET_VERSION}

#---------Argumentos
ARG TimeZone
ARG Language
ARG Unicode

#---------Configura o TimeZone
RUN ln -snf /usr/share/zoneinfo/$TimeZone /etc/localtime && echo $TimeZone > /etc/timezone

#Configurando linguagem
RUN apt-get update && \
    apt-get install -y locales locales-all && \
    locale-gen ${Language}.${Unicode} && \
    update-locale LANG=${Language}.${Unicode}

ENV LANG ${Language}.${Unicode}
ENV LANGUAGE ${Language}

EXPOSE 80 443