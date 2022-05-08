#!/bin/bash

# Download directories vars
root_dl="k700-2020"
root_dl_targz="k700-2020_targz"

# Download train tars, will resume
curr_dl=${root_dl_targz}/train
url=https://s3.amazonaws.com/kinetics/700_2020/train/k700_2020_train_path.txt
[ ! -d $curr_dl ] && mkdir -p $curr_dl
wget -c $url -P $curr_dl
txt_dl=${curr_dl}/k700_2020_train_path.txt
aria2c  -c -i $txt_dl -d $curr_dl

# Download validation tars, will resume
curr_dl=${root_dl_targz}/train
url=https://s3.amazonaws.com/kinetics/700_2020/val/k700_2020_val_path.txt
[ ! -d $curr_dl ] && mkdir -p $curr_dl
wget -c $url -P $curr_dl
txt_dl=${curr_dl}/k700_2020_val_path.txt
aria2c  -c -i $txt_dl -d $curr_dl

# Download test tars, will resume
curr_dl=${root_dl_targz}/test
url=https://s3.amazonaws.com/kinetics/700_2020/test/k700_2020_test_path.txt
[ ! -d $curr_dl ] && mkdir -p $curr_dl
wget -c $url -P $curr_dl
txt_dl=${curr_dl}/k700_2020_test_path.txt
aria2c  -c -i $txt_dl -d $curr_dl

# Download k700-2020 annotations targz file from deep mind
curr_dl=${root_dl_targz}/annotations/deepmind 
[ ! -d $curr_dl ] && mkdir -p $curr_dl
aria2c -c https://storage.googleapis.com/deepmind-media/Datasets/kinetics700_2020.tar.gz -d $curr_dl

# Download k700-2020 annotations targz file from deep mind
curr_dl=${root_dl_targz}/annotations/deepmind_top-up
[ ! -d $curr_dl ] && mkdir -p $curr_dl
aria2c -c https://storage.googleapis.com/deepmind-media/Datasets/kinetics700_2020_delta.tar.gz -d $curr_dl

# Download AVA Kinetics
curr_dl=${root_dl_targz}/annotations/AVA-Kinetics
[ ! -d $curr_dl ] && mkdir -p $curr_dl
aria2c -c https://s3.amazonaws.com/kinetics/700_2020/annotations/ava_kinetics_v1_0.tar.gz -d $curr_dl
aria2c -c https://s3.amazonaws.com/kinetics/700_2020/annotations/countix.tar.gz -d $curr_dl

# Download annotations csv files
curr_dl=${root_dl}/annotations
[ ! -d $curr_dl ] && mkdir -p $curr_dl
wget -c https://s3.amazonaws.com/kinetics/700_2020/annotations/train.csv -P $curr_dl
wget -c https://s3.amazonaws.com/kinetics/700_2020/annotations/val.csv -P $curr_dl
wget -c https://s3.amazonaws.com/kinetics/700_2020/annotations/test.csv -P $curr_dl

# Download readme
wget -c http://s3.amazonaws.com/kinetics/700_2020/K700_2020_readme.txt -P $root_dl

# Downloads complete
echo -e "\nDownloads complete! Now run extractor, k700_2020_extractor.sh"