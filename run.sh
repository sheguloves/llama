run() {
    number=$1
    shift
    for i in `seq $number`; do
      $@
    done
}
run $1 torchrun --nproc_per_node 1 example_chat_completion.py --ckpt_dir llama-2-7b-chat/ 