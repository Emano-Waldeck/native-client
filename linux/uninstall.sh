#!/usr/bin/env bash

cd ./app

MACHINE_TYPE=`uname -m`

which node 2>/dev/null
isNode=$?
echo NodeJS status = $isNode

if [ ${isNode} -eq 0 ]; then
  echo "Using system NodeJS"
  id=`node -e "process.stdout.write(require('./config.js').id)"`
elif [ ${MACHINE_TYPE} == 'x86_64' ]; then
  echo "Using ../node/x64/node"
  id=`../node/x64/node -e "process.stdout.write(require('./config.js').id)"`
else
  echo "Using ../node/x86/node"
  id=`../node/x86/node -e "process.stdout.write(require('./config.js').id)"`
fi

echo "Native Client id is \"${id}\""
echo

echo " .. Removing manifest file for Google Chrome"
rm ~/.config/google-chrome/NativeMessagingHosts/${id}.json
echo " .. Removing manifest file for Chromium"
rm ~/.config/chromium/NativeMessagingHosts/${id}.json
echo " .. Removing manifest file for Mozilla Firefox"
rm ~/.mozilla/native-messaging-hosts/${id}.json
echo " .. Removing executable"
[ -n "$id" ] && rm -r ~/.config/${id}

echo
echo ">>> Native Client is removed <<<".
