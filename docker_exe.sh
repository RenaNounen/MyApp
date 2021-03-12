#!/bin/bash
DOCKER_IMAGE_NAME=death_app
MESSAGE_HEADER="***"

echo -e "${MESSAGE_HEADER} docker を起動します。。。\n"
echo -e "${MESSAGE_HEADER} docker のバージョンは以下を参照ください。。。"
docker -v

# docker build
echo -e "\n${MESSAGE_HEADER} docker image を作成しますか？ (y or n)"
read input1

if [ $input1 = "n" ]; then
  echo -e "${MESSAGE_HEADER} プログラムを終了します。。。\n"
  exit 1
elif [ $input1 = "y" ]; then
  echo -e "${MESSAGE_HEADER} docker image '${DOCKER_IMAGE_NAME}' を作成します。\n"
  docker build -t ${DOCKER_IMAGE_NAME} .
else
  echo -e "${MESSAGE_HEADER} ちょっと何言ってるかわかんないっすね。。。\n"
  exit 1
fi

# docker run
if [ "$(docker image ls -q "${DOCKER_IMAGE_NAME}")" ]; then
  echo -e "\n${MESSAGE_HEADER} docker を起動します。。。\n"
  echo -e "${MESSAGE_HEADER} 終了するときは、exit コマンドで docker container を停止してください。。。\n"
  docker run -it --rm \
             -v $PWD:/home \
             ${DOCKER_IMAGE_NAME} /bin/bash
else
  echo -e "${MESSAGE_HEADER} おやおや、docker image が見つかりませんね。。。\n"
  echo -e "${MESSAGE_HEADER} docker image を作成した方が良いのでは？？？\n"
  exit 1
fi

# docker image 削除
echo -e "${MESSAGE_HEADER} docker image を削除しますか？ (y or n)"
echo -e "${MESSAGE_HEADER}${MESSAGE_HEADER} (また、すぐに使うなら削除しない方がいいよね、、、)"
echo -e "${MESSAGE_HEADER}${MESSAGE_HEADER} (でも docker image を更新する予定があるなら削除しといたら？？？)\n"
read input2

if [ $input2 = "n" ]; then
  echo -e "${MESSAGE_HEADER} OK! docker image は消さないよ。。。\n"
elif [ $input2 = "y" ]; then
  echo -e "${MESSAGE_HEADER} docker image を削除します。。。\n"
  docker build -t ${DOCKER_IMAGE_NAME} .
else
  echo -e "${MESSAGE_HEADER} ちょっと何言ってるかわかんないんで、何もしないっす。。。\n"
fi
