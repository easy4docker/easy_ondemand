# easy_backend_cloud

== Local Setup ===

DOCKERCMD=$(command -v docker)
MAIN_NET="10.10.10"
MAIN_IP="10.10.10.254"

if  [ "$DOCKERCMD" = "" ]; then
    echo "\nDocker should be installed!"
    exit 1
fi

NETWORK_NAME=network_easydocker
if [ -z $(docker network ls --filter name=^${NETWORK_NAME}$ --format="{{ .Name }}") ] ; then 
    docker network create \
        --driver=bridge \
        --subnet=${MAIN_NET}.0/16 \
        --ip-range=${MAIN_NET}.0/24 \
        --gateway=${MAIN_IP} \
       network_easydocker &> /dev/null
fi

SCR_DIR=$(cd `dirname $0` && pwd)

rm -fr ${SCR_DIR}/code
rm -fr ${SCR_DIR}/env

mkdir -p ${SCR_DIR}/data
mkdir -p ${SCR_DIR}/code
mkdir -p ${SCR_DIR}/env

echo "{\"initToken\":\"local\", \"list\":{\"local\":1}}" > ${SCR_DIR}/env/token.json

cd ${SCR_DIR}/code
git clone https://github.com/easy4docker/easy_python_cloud.git .


docker container stop backendcloud-local-container
docker container rm backendcloud-local-container
docker container stop backendcloud-local-container_eng
docker container rm backendcloud-local-container_eng

docker image rm -f backendcloud-local-image
docker image rm -f backendcloud-local-image_eng

cd ${SCR_DIR}/code/dockerSetting

docker build -f ${SCR_DIR}/code/dockerSetting/dockerFile -t backendcloud-local-image .
docker build -f ${SCR_DIR}/code/dockerSetting/dockerFileCloudEngine -t backendcloud-local-image_eng .



docker run -d --restart=on-failure -v "${SCR_DIR}/code/mainServer":/var/_localApp -v "${SCR_DIR}/data":/var/_localAppData  \
--network network_easydocker --name backendcloud-local-container  backendcloud-local-image 
docker run -d --restart=on-failure -e ROOT_HOST="10.10.10.254" -e MAIN_PORT=""  -e ROOT_PASSWORD=FqId5mSyCpvhmP08eoyn4VaVfJZUc7uY  -p 9080:80 \
-v "${SCR_DIR}/code":/var/_localApp -v "${SCR_DIR}/data":/var/_localAppData -v "${SCR_DIR}/env":/var/_localAppEnv --network network_easydocker \
--name backendcloud-local-container_eng  backendcloud-local-image_eng

echo "http://localhost:9080?token=local"
