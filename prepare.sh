#!/usr/bin/env bash

python3 setup.py develop
pip3 install pycocotools
pip3 install terminaltables
pip3 install mmcv
mkdir txtresults
mkdir data
cd data
hdfs dfs -get $PAI_DEFAULT_FS_URI/data/datasets/2018origincoco.zip
unzip -q 2018origincoco.zip
cd ..
bash tools/dist_train.sh configs/faster_rcnn_x101_64x4d_fpn_1x.py 2
