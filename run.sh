run() {
    number=$1
    shift
    for i in `seq $number`; do
      $@
      sudo sh -c 'echo 1 >  /proc/sys/vm/drop_caches'
      sudo sh -c 'echo 2 >  /proc/sys/vm/drop_caches'
      sudo sh -c 'echo 3 >  /proc/sys/vm/drop_caches'
    done
}
run $1 torchrun --nproc_per_node 1 example_chat_completion.py --ckpt_dir $2 