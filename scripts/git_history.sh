#!/bin/bash

if [ $# = 0 ] ; then
  echo "Usage: $0 filename"
  exit 1
fi

message_size=30
filename="$1"
if [ $# = 2 ] ; then
  message_size=$2
fi

git blame $filename --line-porcelain | grep -v previous | awk 'NR%12==0||NR%12==10||NR%12==1' | awk '{ if (NR%3==1) $0=substr($0, 1, 8); if (NR%3==2) { sub(/^summary /,""); len=length; if (len>'$(expr $message_size + 2)') {$0=substr($0, 1, '$(echo $message_size)') "..";} else {$0=substr($0, 1, '$(expr $message_size + 3)'); while (length < '$(expr $message_size + 2)') $0=$0 " ";} } print $0 }' | awk 'ORS=NR%3?" | ":"\n"'
