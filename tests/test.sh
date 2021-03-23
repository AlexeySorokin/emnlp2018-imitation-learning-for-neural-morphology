#/usr/bin/bash
echo "Usage: test.sh TRAIN_PATH DEV_PATH TEST_PATH MODEL_DIR"
if [ "$#" -ne 4 ]; then 
    echo "Illegal number of arguments"
    exit 1
fi
cd lib

python run_transducer.py --dynet-seed 1 --dynet-mem 500 --dynet-autobatch 0  --transducer=haem --sigm2017format \
--input=100 --feat-input=20 --action-input=100 --pos-emb  --enc-hidden=200 --dec-hidden=200 --enc-layers=1 \
--dec-layers=1   --mlp=0 --nonlin=ReLU --il-optimal-oracle --il-k=12 --il-loss=nll --il-beta=5.0 --il-global-rollout \
--dropout=0 --optimization=ADADELTA --l2=0  --batch-size=1 --decbatch-size=25  --patience=15 --epochs=50 \
--tag-wraps=both --param-tying  --mode=il  --beam-width=0 --beam-widths=4  $1 $2 $4 --test-path=$3

cd ..
