echo "==English->Italian============================";
sh inconsistency.sh en-it > /tmp/en-it.testvoc; sh inconsistency-summary.sh /tmp/en-it.testvoc en-it
echo ""
echo "==Italian->English=============================";
bash inconsistency.sh it-en > /tmp/it-en.testvoc; bash inconsistency-summary.sh /tmp/it-en.testvoc it-en
