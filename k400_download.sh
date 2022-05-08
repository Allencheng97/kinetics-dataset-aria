#!/bin/bash

# Download directories vars
root_dl="k400"
root_dl_targz="k400_targz"

# Make root directories
[ ! -d $root_dl ] && mkdir $root_dl
[ ! -d $root_dl_targz ] && mkdir $root_dl_targz

# Download train tars, will resume
curr_dl=${root_dl_targz}/train
url=https://s3.amazonaws.com/kinetics/400/train/k400_train_path.txt
[ ! -d $curr_dl ] && mkdir -p $curr_dl
wget -c $url -P $curr_dl
txt_dl=${curr_dl}/k400_train_path.txt
aria2c  -c -i $txt_dl -d $curr_dl

# Download validation tars, will resume
curr_dl=${root_dl_targz}/val
url=https://s3.amazonaws.com/kinetics/400/train/k400_val_path.txt
[ ! -d $curr_dl ] && mkdir -p $curr_dl
wget -c $url -P $curr_dl
txt_dl=${curr_dl}/k400_val_path.txt
aria2c  -c -i $txt_dl -d $curr_dl

# Download test tars, will resume
curr_dl=${root_dl_targz}/test
url=https://s3.amazonaws.com/kinetics/400/test/k400_test_path.txt
[ ! -d $curr_dl ] && mkdir -d $curr_dl
wget  -c  $url -P $curr_dl
txt_dl=${curr_dl}/k400_test_path.txt
aria2c  -c -i $txt_dl -d $curr_dl

# Download replacement tars, will resume
curr_dl=${root_dl_targz}/replacement
url=https://s3.amazonaws.com/kinetics/400/replacement_for_corrupted_k400.tgz
[ ! -d $curr_dl ] && mkdir -d $curr_dl
aria2c  -c $url -d $curr_dl

curr_dl=${root_dl}/annotations
url_tr=https://s3.amazonaws.com/kinetics/400/annotations/train.csv
url_v=https://s3.amazonaws.com/kinetics/400/annotations/val.csv
url_t=https://s3.amazonaws.com/kinetics/400/annotations/test.csv
[ ! -d $curr_dl ] && mkdir -d $curr_dl
wget  -c $url_tr -d $curr_dl
wget  -c $url_v -d $curr_dl
wget  -c $url_t -d $curr_dl

# Download readme
url=http://s3.amazonaws.com/kinetics/400/readme.md
wget  -c $url -d $root_dl

# Downloads complete
echo -e "\nDownloads complete! Now run extractor, k400_extractor.sh"
