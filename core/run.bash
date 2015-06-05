###run.bashはrange_to_gzを少しいじったもの###
#!/bin/bash

trap 'exit 0' 1

while sleep 0.1 ; do
        mawk '{print $1}' /dev/rtlightsensor0 > /dev/rtbuzzer0
done
