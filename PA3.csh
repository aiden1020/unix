#!/usr/bin/tcsh
set card_faces = ( 0 0 0 0 0 0 0 0 0 0 0 0 0 )
set card_suits = ( 0 0 0 0 )
set suits = ( ♦ ♥ ♠ ♣ )
foreach i ( `seq 0 51|sort -R|head -5|sort` )
    @ suitIndex = `expr 1 + $i / 13`
    @ facesIndex = `expr 1 + $i % 13`
    echo -n \ `echo $facesIndex | grep '1[0-3]' | cut -c 2- | tr '0123' 'JQKA' || expr 1 + $facesIndex` ${suits[$suitIndex]}
    @ card_faces[$facesIndex]++
    @ card_suits[$suitIndex]++
end
echo -n ": "
switch ( `echo "$card_faces"| tr ' ' '\n'| sort -rn|tr -d '[:space:]0'`)
  case 41:
      echo Four of a kind! ;breaksw
  case 32:
      echo Full house! ;breaksw
  case 311:
      echo Three of a kind! ;breaksw
  case 221:
      echo Two pair! ;breaksw
  case 2111:
      echo One pair! ;breaksw
  case 11111:

  set flush = ""
  if ("$card_suits" =~ "*5*" ) set flush = \ Flush!
  if ( `echo $card_faces` =~ '*1 1 1 1 1*' ) then
    echo Straight$flush!
  else if ( `echo $card_faces[1-4]' '$card_faces[13]` =~ '1 1 1 1 1' ) then
    echo Straight$flush!
  else if ( $flush != "" ) then
    echo Flush!
  else
    foreach i (`seq 13 -1 1`)
      if ("$card_faces[$i]" == "1") then
        switch ($i)
            case 13:
              echo Ace high! ;exit
            case 12:
              echo King high! ;exit
            case 11:
              echo Queen high! ;exit
            case 10:
              echo Jack high! ;exit
            case 9:
              echo 10 high! ;exit
            case 8:
              echo 9 high! ;exit
            case 7:
              echo 8 high! ;exit
            case 6:
              echo 7 high! ;exit
        endsw
      endif
    end
  endif
endsw
