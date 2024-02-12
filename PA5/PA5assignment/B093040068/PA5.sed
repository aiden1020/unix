#!/usr/bin/sed -nf
H
s/^.\{2\}\(.*\)$/\1/p
g

:J;tJ 
s/.\(.\).*\n.\1.*\n.\1.*\n.\1.*\n.\1.*$/Flush/p
s/\(.\).*\n\(.\).*\n\2.*\n\2.*\n\2.*$/Four of kind/p
s/\(.\).*\n\1.*\n\1.*\n\1.*\n.*$/Four of kind/p

$!d
/Flush$\|Four of kind$/q


s/\(..\).*\n\(.\).*\n\(.\).*\n\(.\).*\n\(.\).*/\1\2\3\4\5/
s/\n//g


/.*\(.\)\1\1\.*/!b FirstLabel
   /.*\(.\)\1\1*\(.\)\2\2*/c Full house
   /.*\(.\)\1\1.*/c Three of a kind
:FirstLabel
/.*\(.\)\1\.*/!b SecondLabel
   /.*\(.\)\1.*\(.\)\2.*/c Two pair
   /.*\(.\)\1.*/c One pair
:SecondLabel

s/$/_23456789T/

/\(^23456\|^34567\|^45678\|^56789\|^6789T\)\(_23456789T\)/c Straight

/^A2345_23456789T/c Straight

/\(^9JKQT\|^AJKQT\)\(_23456789T\)/c Straight

/^89JQT_23456789T/c Straight

/^789JT_23456789T/c Straight

/.*/c Nothing

