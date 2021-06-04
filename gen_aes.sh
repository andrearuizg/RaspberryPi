#!/bin/bash

openssl rand -base64 32 | cut -c 1-31 > ./Documentos/aesKey.txt
openssl rsautl -encrypt -inkey public_pc.pem -pubin -in ./Documentos/aesKey.txt -out aesKey.txt.crypted
