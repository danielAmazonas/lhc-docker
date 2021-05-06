#!/bin/bash

LHC_DOWNLOAD_URL=https://github.com/LiveHelperChat/livehelperchat/tarball/master

echo -e "== Baixando a última versão do LHC =="
curl -L "$LHC_DOWNLOAD_URL" | tar xz
