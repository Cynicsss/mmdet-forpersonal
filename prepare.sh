#!/usr/bin/env bash

python3 setup.py develop
pip3 install pycocotools
pip3 install terminaltables
pip3 install mmcv
mkdir data
cd data
hdfs dfs -get $PAI_DEFAULT_FS_URI/data/datasets/undertotalcoco.zip
unzip -q undertotalcoco.zip
mv ./coco/annotations/instance_train2017.json ./coco/annotations/instances_train2017.json
mv ./coco/annotations/instance_val1.json ./coco/annotations/instances_val2017.json
mv ./coco/val12017 ./coco/val2017
cd ..
bash tools/dist_train.sh configs/cascade_rcnn_x101_32x4d_fpn_1x.py 2
