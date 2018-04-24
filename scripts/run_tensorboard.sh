#!/bin/bash

echo "Running tensorboard..."

python3 -c "import subprocess; subprocess.Popen('tensorboard --logdir=/content/Neural_Networks-demo/logdir/ --host=0.0.0.0 --port=6006'.split())"

if ! [ -e /content/ngrok ]
then
    wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
    unzip -o ngrok-stable-linux-amd64.zip > /dev/null 2>&1
fi

python3 -c "import subprocess; subprocess.Popen('/content/ngrok http 6006 &'.split())"

curl -s http://localhost:4040/api/tunnels | python3 -c "import sys, json; print('Tensorboard Link:', json.load(sys.stdin)['tunnels'][0]['public_url'])"