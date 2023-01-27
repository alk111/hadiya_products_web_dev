#!/bin/bash
echo "${DEVELOPMENT}"
BRANCH_NAME=${development}
echo "$BRANCH_NAME"
echo "installing..."
npm install || exit 1

if [ "$BRANCH_NAME" == "origin/development" ]
then
echo "building development..."
ng build || exit 1
ls
sudo azcopy copy 'dist/**' 'https://alkaifstorageaccount.blob.core.windows.net/$web?sp=racwd&st=2023-01-27T10:01:12Z&se=2023-01-27T18:01:12Z&spr=https&sv=2021-06-08&sr=c&sig=eRWhj3viLfMp%2B82Gdard%2FMW%2BHG50yJgVpspMkptySI4%3D' --recursive
fi
