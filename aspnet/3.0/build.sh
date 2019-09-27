export TIMEZONE="America/Sao_Paulo"
export LANGUAGE="pt_BR"
export UNICODE="UTF-8"

export DOT_NET_CORE_ASPNET_VERSION="3.0"

echo "------------------------------------------------------"
echo "docker-compose build $DOT_NET_CORE_ASPNET_VERSION"
docker-compose -f ../docker-compose.build.yml build
echo "------------------------------------------------------"

echo
echo "------------------------------------------------------"
echo "docker push tjmt/dotnetcore:aspnet-$DOT_NET_CORE_ASPNET_VERSION"
docker push tjmt/dotnetcore:aspnet-$DOT_NET_CORE_ASPNET_VERSION
echo "------------------------------------------------------"