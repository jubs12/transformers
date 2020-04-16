#!/bin/bash

TASK=tweetsent
OPTION=$1
MODEL=$2

PT_ARGS="--data_dir ../$TASK/original/   \
         --model_type bert               \
         --logging_steps 400             \
         --save_steps 3000               \
         --max_seq_length 128            \
         --learning_rate 2e-5            \
         --num_train_epochs 4.0          \
         --per_gpu_train_batch_size 1    \
         --per_gpu_eval_batch_size  1    \
         --gradient_accumulation_steps 8"

EN_ARGS="--data_dir ../$TASK                \
         --model_type roberta               \
         --logging_steps 400                \
         --save_steps 3000                  \
         --max_seq_length 128               \
         --learning_rate 1e-5               \
         --per_gpu_eval_batch_size  1       \
         --per_gpu_train_batch_size 1       \
         --gradient_accumulation_steps 16   \
         --num_train_epochs 11.0            \
         --warmup_steps 120"     

mkdir $TASK $TASK/original $TASK/output $TASK/output/$MODEL
rm -rfv /root/.cache/torch/transformers/
rm -rfv /container/*/original/cached*

if [ "$OPTION" = "PT" ]; then
   ARGS=$PT_ARGS
   ORIGINAL="original/"
elif [ "$OPTION" = "EN" ]; then
   ARGS=$EN_ARGS
   MODEL=roberta-large
   ORIGINAL=""
else
   echo "invalid option"
fi

echo $ORIGINAL

cp -v $TASK/"$ORIGINAL$TASK"_test.tsv $TASK/"$ORIGINAL"dev.tsv
cp -v $TASK/"$ORIGINAL$TASK"_train.tsv $TASK/"$ORIGINAL"train.tsv

cd transformers_nadia
python3 examples/run_glue.py  --task_name tweetsent --do_train --do_eval $ARGS --model_name_or_path $MODEL --output_dir ../$TASK/output/$MODEL --overwrite_cache  --overwrite_output_dir

cd ..
