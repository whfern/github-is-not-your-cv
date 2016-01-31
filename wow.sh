COMMIT_DATE="2016-02-01"
for j in {1..365}
do
    COMMIT_DATE=$(gdate "--date=$COMMIT_DATE - 1 days" +%Y-%m-%d)
    COMMIT_AMOUNT=0
    while [ "$COMMIT_AMOUNT" -le 20 ]
    do
        COMMIT_AMOUNT=$RANDOM
        let "COMMIT_AMOUNT %= 100"
    done
    for i in $(eval echo "{1..$COMMIT_AMOUNT}")
    do
	COMMIT_MESSAGE=$(fortune)
        cat /dev/urandom | LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1 >> cv
        git commit -am "watch this" --date=$COMMIT_DATE
    done
    git push
    rm cv
done
