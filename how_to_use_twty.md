# twtyの使い方

## インストール

**前提条件**
goコマンドが実行できること

```
go version
# go version go1.19 darwin/amd64
```

インストール

```
brew install twty
```

認証処理する(ブラウザが起動するので、表示された6桁の認証コードをコマンドラインに貼り付けてエンター)

```
$ twty
Open this URL and enter PIN.
https://api.twitter.com/oauth/authenticate?oauth_token=XXXXXXXXXXXXXXXXXXXXXXXXXXX
PIN: XXXXXX <<< ブラウザの認証コードを入力
```

## ID付きの自分のツイート一覧

```
twty -v
```

## リプライ

```
twty_message=メッセージ　メッセージ
echo $twty_message
twty -i 1568521648919429121 $twty_message
```

## ファイルに書き込んで送信

```
twty -ff ~/twty.md
```

## タイムラインを表示

```
twty -u makotodeveloper
```

## リプライの一覧を表示

```
twty -r
```

