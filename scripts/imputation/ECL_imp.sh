export CUDA_VISIBLE_DEVICES=1
model_name=FEDformer
d_model=32
d_ff=32
seq_len=96
label_len=0
pred_len=0
learning_rate=0.001
lradj=type1
#for mask_rate in 0.125 0.25 0.375 0.5 0.625 0.75
#for mask_rate in 0.125
for mask_rate in 0.25 0.375 0.5 0.625 0.75
do
  python -u run.py \
    --task_name imputation \
    --is_training 1 \
    --root_path ./dataset/electricity/ \
    --data_path electricity.csv \
    --model_id ECL_mask_${mask_rate} \
    --mask_rate $mask_rate \
    --model $model_name \
    --data custom \
    --features M \
    --seq_len $seq_len \
    --label_len $label_len \
    --pred_len $pred_len \
    --e_layers 2 \
    --d_layers 1 \
    --factor 3 \
    --enc_in 321 \
    --dec_in 321 \
    --c_out 321 \
    --batch_size 16 \
    --d_model $d_model \
    --d_ff $d_ff \
    --des 'Exp' \
    --itr 1 \
    --top_k 5 \
    --learning_rate $learning_rate \
    --lradj $lradj \
    --train_epochs 10
done 

