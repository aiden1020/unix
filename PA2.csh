#!/usr/bin/tcsh
cd $1
ls ?? | xargs -l fgrep ../allcards -e | cut --complement -c1-2
ls ?H |& fgrep -v : | wc -l > ___tempfile1
ls ?C |& fgrep -v : | wc -l >> ___tempfile1
ls ?D |& fgrep -v : | wc -l >> ___tempfile1
ls ?S |& fgrep -v : | wc -l >> ___tempfile1
fgrep 5 ___tempfile1|cut -c 1-2 --complement |tr -d "\n" && echo Flush!
ls ??|grep "[2-9]"|cut -c 1  > faces
ls ??|grep "[TAJQK]"|cat -n |tr "12345" 1|tr -d "\t "|tr "T" "0"|tr "A" "4"|tr "J" "1"|tr "Q" "2"|tr "K" "3"|cut -c 1-2 >>faces
cat faces | uniq -c|cut -c 7 >facecounts
expr `wc -l < facecounts` == 4 |tr -d "01\n"&& echo One Pair!
expr `wc -l < facecounts` == 3 |tr -d "01\n"&& grep 2 facecounts && echo Two Pair!
expr `wc -l < facecounts` == 3 |tr -d "01\n"&& grep 3 facecounts |tr -d "3\n"&& echo Three of a kind!
expr `wc -l < facecounts` == 2 |tr -d "01\n"&& grep 4 facecounts |tr -d "4\n"&& echo Four of a kind!
expr `wc -l < facecounts` == 2 |tr -d "01\n"&& grep 3 facecounts |tr -d "3\n"&& echo Full house!
expr `wc -l < facecounts` == 5 |tr -d "01\n"&&expr `sort faces -n |tail -1` - `sort faces -n|head -1` == 4 |tr -d "01\n" && echo Straight!
expr `wc -l < facecounts` == 5 |tr -d "01\n"&&expr `sort faces -n |tail -1` - `sort faces -n|head -1` == 12 |tr -d "01\n"&&expr `sort faces -n| head -4|tail +4` - `sort faces -n|head -1` == 3 |tr -d "01\n" && echo Straight!
