#!/usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"


download_latest_fzf () {
	FZF_LATEST="https://api.github.com/repos/junegunn/fzf-bin/releases/latest"
	BIN_URL="$(curl -s $FZF_LATEST | grep "browser_download_url.*"${1} | sed -E 's/.*"([^"]+)".*/\1/')"
	echo "Downloading from ${BIN_URL}"
	curl -fLso $1 $BIN_URL

	echo "Unpackaging ${1}"
	tar -xvf $1
	echo "Deleting ${1}"
	rm $1
}

download_latest_fzf "linux_amd64.tgz"

echo "Moving fzf to Linux folder"
mkdir -p $SCRIPT_PATH"/Linux"
mv fzf $SCRIPT_PATH"/Linux"


download_latest_fzf "darwin_amd64.tgz"

echo "Moving fzf to Darwin folder"
mkdir -p $SCRIPT_PATH"/Darwin"
mv fzf $SCRIPT_PATH"/Darwin"

