wget https://www.gutenberg.org/files/11/11.txt
csplit --suppress-matched 11.txt "/START OF THIS PROJECT GUTENBERG EBOOK ALICE'S ADVENTURES IN WONDERLAND/" "/End of Project Gutenberg's Alice's Adventures in Wonderland, by Lewis Carroll/"
mv xx01 alice.txt
rm xx00 xx02
./corenlp.sh -annotators tokenize,ssplit,pos,lemma -ssplit.newlineIsSentenceBreak two -outputFormat conll -file alice.txt
./corenlp.sh -annotators tokenize,ssplit,pos,lemma,depparse -ssplit.newlineIsSentenceBreak two -outputFormat json -file alice.txt
zip alice.zip readme.alice.md 11.txt alice.txt alice.txt.conll alice.txt.json

