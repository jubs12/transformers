# Transformers
Portuguese BERT base, BERT multilingual base and RoBERTa large evaluation on ASSIN 1 rte and TweetSentBR using [Transformers](https://github.com/huggingface/transformers/tree/83703cd077d615e09c5ccb2caf57a893432db189) in addition to [ASSIN 1 sts and ASSIN2 evalution](https://github.com/ruanchaves/assin).


[Original README](https://github.com/huggingface/transformers/blob/83703cd077d615e09c5ccb2caf57a893432db189/README.md)


TweetSentBR formatted data is not available due to Twitter Policy.

##  Instructions



1.  Install requirements

   ```bash
   pip install -r ./examples/requirements.txt
   ```

2. Update Transformers package to support these tasks

   ```bash
   pip install --upgrade 
   ```

3. Run task
   
   Replace {TASK_TYPE} for assin and tweesent
   
   Replace {TASK} for assin-ptbr-rte, assin-ptbr-rte. Leave in blank for tweetsent.

   
   
   a)  For  BERT multilingual
   
    ```bash
   bash run_{TASK_TYPE}.sh {TASK} PT bert-base-multilingual-cased
    ```
   
   b)  For Portuguese BERT
   
    ```bash
    bash run_{TASK_TYPE}.sh {TASK} PT neuralmind/bert-base-portuguese-cased
    ```
   
    c) For RoBERTa
   
   ```bash
   bash run_{TASK_TYPE}.sh {TASK} EN
    ```



## Results

Transformers repository was modified to output predictions.py in output/{MODEL}/{TASK}.

Evaluations and XML ASSIN are in output/{MODEL}.


XML ASSIN Similarity labels were not modified.
