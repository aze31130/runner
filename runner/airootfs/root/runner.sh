#!/bin/bash

# This script ensures that a valid forgejo token is given in .token file here.
read -r token < /root/.token
runnerVersion="5.0.3"
instanceURL="https://git.aze.sh"
downloadURL="https://code.forgejo.org/forgejo/runner/releases/download/v$runnerVersion/forgejo-runner-$runnerVersion-linux-amd64"
runnerFile="forgejo-runner"

curl -o $runnerFile $downloadURL
chmod +x $runnerFile

# Registers the runner
./$runnerFile register --no-interactive --instance $instanceURL --token $token --name archiso

#Start docker
systemctl start docker.service

# Exec runner
./$runnerFile daemon