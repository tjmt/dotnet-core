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
    apt-get install --no-install-recommends -y tzdata locales locales-all && \
        locale-gen ${Language}.${Unicode} && \
        update-locale LANG=${Language}.${Unicode}
    
#---------Configura o TLS Min Protocol Version para v1
RUN sed -i 's/DEFAULT@SECLEVEL=2/DEFAULT@SECLEVEL=1/g' /etc/ssl/openssl.cnf
RUN sed -i 's/MinProtocol = TLSv1.2/MinProtocol = TLSv1/g' /etc/ssl/openssl.cnf
RUN sed -i 's/DEFAULT@SECLEVEL=2/DEFAULT@SECLEVEL=1/g' /usr/lib/ssl/openssl.cnf
RUN sed -i 's/MinProtocol = TLSv1.2/MinProtocol = TLSv1/g' /usr/lib/ssl/openssl.cnf

ENV LANG ${Language}.${Unicode}
ENV LANGUAGE ${Language}

EXPOSE 80 443