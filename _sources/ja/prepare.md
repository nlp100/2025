# 実行環境の準備

言語処理100本ノック 2025を始めるにはプログラミング環境が必要です。また、第8章から第10章までの問題の一部では、GPUなどの深層学習向けアクセラレータが必要になります。深層学習向けのプログラミング環境を整備するには、高度な知識やスキルが必要になりますので、特段の理由が無ければ[Google Colaboratory](https://colab.research.google.com/)や[SageMaker Studio Lab](https://studiolab.sagemaker.aws/)などのクラウド上のJupyter実行環境を活用することをお勧めします。

## Google Colaboratory

各章のページ右上のロケット（🚀）のアイコンをクリックし、Colabを選ぶと、Google Colaboratory上でその章の問題を（Jupyter Notebookとして）開くことができます。

```{image} images/launch-on-colab.png
:alt: Launch on Colab
:class: bg-primary mb-1
:align: center
```

あとは、コードセルを挿入してコーディングを行い、プログラムを実行しながら学習を進めましょう。Google Colaboratoryの基本的な使い方は、他のウェブサイト等を参考にしてください。[Python早見帳](https://chokkan.github.io/python/)にも[Google Colaboratoryの使い方](https://chokkan.github.io/python/jupyter.html#google-colaboratory)がまとめられています。

```{image} images/colaboratory.png
:alt: Colaboratory
:class: bg-primary mb-1
:align: center
```

以降では、特に重要な事柄を説明します。

### APIキーの管理

言語処理100本ノックの5章で大規模言語モデルの有料API（例えばOpenAIのGPT-4シリーズのAPI）を用いる場合、APIキーが必要になります。
このAPIキーが漏洩してしまうと、他人が勝手に有料のAPIを使い、その利用料があなたに請求されることになります。
Google Colaboratoryのコードセル中にAPIキーをべた書きしていると、Notebookを他人と共有した時にAPIキーが漏洩する恐れがあります。
また、GitHubなどのレポジトリで管理しているソースコードの中にAPIキーを書いてしまうと、やはりAPIキーの漏洩につながります。
したがって、**コード中にAPIキーを書かない**という習慣を身に付けておくことが大切です。

Google Colaboratoryには、APIキーのような秘密の文字列を管理する機能があります。左側のツールバーから鍵（🔑）のアイコンをクリックすると、キーとその値を管理する画面が現れます。ここで、キーの名前を適当に決めて「名前」欄に、キーの内容を「値」欄に入力し、「ノートブックからのアクセス」にチェックを入れます。すると、ここに登録したAPIキー（値）をコードの実行時に取得できます。

```{image} images/colab-secret.png
:alt: Secret
:class: bg-primary mb-1
:align: center
```

例えば、`OPENAI_KEY`として`apikey1234abc`を登録した場合、以下のコードを実行すると変数`api_key`に文字列`"apikey1234abc"`が得られます。

```python
from google.colab import userdata
api_key = userdata.get('OPENAI_KEY')
```

この変数を使ってOpenAIのライブラリにAPIキーを渡せば、コード中にAPIキーを書かずに済みます。このような秘密の文字列の管理は、第9章や第10章でHuggingFaceのアクセストークンやWandBのAPIキーの管理でも重宝します。

