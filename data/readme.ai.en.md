The zip archive `ai.en.zip` contains the article "[Artificial intelligence](https://en.wikipedia.org/wiki/Artificial_intelligence)" from [English Wikipedia](https://en.wikipedia.org/).

+ `ai.en.txt`: the text extracted from the Wikipedia article
+ `ai.en.txt.json`: the text annotated with dependency trees (in JSON format)

We used [WikiExtractor](https://github.com/attardi/wikiextractor) to extract the text `ai.en.txt` from the original MediaWiki article (in XML format). The part-of-speech tags and dependency trees were annotated by [Stanford CoreNLP](https://stanfordnlp.github.io/CoreNLP/). This is a rough explanation of how to obtain `ai.en.txt` and `ai.en.txt.json`.

```
# Extract text from ai.en.xml (the article in XML format).
$ python WikiExtractor.py ai.en.xml
# Prepare ai.en.txt by editing the output from the tool, e.g., text/AA/wiki_00

# Apply Stanford CoreNLP to ai.en.txt
$ ./corenlp.sh -annotators tokenize,ssplit,pos,lemma,depparse -outputFormat json -file ai.en.txt
```

These files are distributed under the term of [Creative Commons Attribution-ShareAlike 3.0 Unported](https://creativecommons.org/licenses/by-sa/3.0/legalcode).
