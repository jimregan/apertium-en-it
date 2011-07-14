TMPDIR=/tmp

if [[ $1 = "it-en" ]]; then

lt-expand ../apertium-en-it.it.dix | grep -v REGEX | grep -v '<prn><enc>' | grep -v ':<:'  | sed 's/:>:/%/g' | sed 's/:<:/%/g' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |
        apertium-pretransfer|
        apertium-transfer ../apertium-en-it.it-en.t1x  ../it-en.t1x.bin  ../it-en.autobil.bin |
        apertium-interchunk ../apertium-en-it.it-en.t2x  ../it-en.t2x.bin |
        apertium-postchunk ../apertium-en-it.it-en.t3x  ../it-en.t3x.bin  | tee $TMPDIR/tmp_testvoc2.txt |
        lt-proc -d ../it-en.autogen.bin > $TMPDIR/tmp_testvoc3.txt
paste -d _ $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc3.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g'

elif [[ $1 = "en-it" ]]; then

lt-expand ../.deps/en.dix | grep -v REGEX | grep -v '<prn><enc>' | grep -v ':<:' | sed 's/:>:/%/g' | sed 's/:<:/%/g' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |
        apertium-pretransfer|
        apertium-transfer ../apertium-en-it.en-it.t1x  ../en-it.t1x.bin  ../en-it.autobil.bin |
        apertium-interchunk ../apertium-en-it.en-it.t2x  ../en-it.t2x.bin |
        apertium-postchunk ../apertium-en-it.en-it.t3x  ../en-it.t3x.bin  | tee $TMPDIR/tmp_testvoc2.txt |
        lt-proc -d ../en-it.autogen.bin > $TMPDIR/tmp_testvoc3.txt
paste -d _ $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc3.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g'


else
	echo "sh inconsistency.sh <direction>";
fi
