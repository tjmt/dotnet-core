clear
##-------------- RELEASE
export TIMEZONE="America/Cuiaba"
export LANGUAGE="pt_BR"
export UNICODE="UTF-8"

export DOT_NET_CORE_ASPNET_VERSION="2.2"
docker-compose -f ../docker-compose.build.yml build
docker-compose -f ../docker-compose.build.yml push