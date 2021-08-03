---
title: 法人番号システム Web-API 用パッケージ corp の紹介
date: 2021-08-03
description: 法人番号システム Web-API に対するリクエストを行う Go パッケージ「corp」に関して
tags:
    - tech
    - go
author: 松島
cover: images/blogs/2021-08-03/cover-2.jpg
ogp_image: images/blogs/2021-08-03/cover-2.jpg
---

当社で開発ならびに公開している [法人番号システム Web-API][corp-api] 用の Go パッケージ(ライブラリ) の紹介です。

[fillin-inc/go-corp][github]

<!--more-->

### 法人番号システム Web-API

法人番号システム Web-API は [国税庁の法人番号公表サイト][corp] の法人検索機能を Web-API として公開したものです。
Web 経由でリクエストを送信することで法人検索を行えます。

3 種類の検索方法があります。

1. 法人番号に一致する会社情報の取得
1. 期間, 対象地域を限定した法人名や住所を変更した会社情報の取得
1. 法人名の一部が一致する会社情報の取得

利用にはアプリケーション ID が必要です。
[アプリケーション ID の発行届出フォーム][corp-token] から申請することで取得できます。
郵送で書面が送られてくるため, 申請から取得までのリードタイムに注意してください。

### corp パッケージ

[corp][github] は法人番号システム Web-API への
リクエスト URL 生成, リクエストからレスポンスの取得まで対応する Go 言語用ライブラリです。

次の実装がしてあります。

* 主要なリクエスト & レスポンス取得に対応したメソッド
* 法人番号をしたいした場合のチェックデジット検証処理(`checkdigit` サブパッケージ)
* Web-API のリクエスト方法をすべてサポートした URL 生成処理(`request` サブパッケージ)

機能や実装の詳細については [Go Doc][doc] を確認してください。


### なぜ作っているのか

当社では [AWS Lambda][lambda] を用いた
サーバーレスアーキテクチャーによるシステム開発の研究開発を進めています。
その使用料は実行時のメモリ使用量と実行時間で決定されるため,
当社が扱うプログラミング言語の中で最もメモリ効率が良い Go 言語を採用しています。

法人番号をキーとした取引先管理に関する機能を実装した際に副産物として [corp][github] を実装しました。
今後の利用する可能性が高いと考えられたため, 整理してパッケージとして公開しています。

当社では *ある程度の実用性があり販売するほどでもないような場合* に OSS として公開する場合が多いです。


### 最後に

当社では現在サーバーレスアーキテクチャーの研究開発を行っています。
対中小企業様の取引において費用対効果の高いシステムを提供できると考えています。

当社の取り組みや法人番号システム, [corp][github] にご興味がある方はお気軽にお問い合わせください。
オフィスを移転したのでお打ち合わせも可能です。

[corp]: https://www.houjin-bangou.nta.go.jp/
[corp-api]: https://www.houjin-bangou.nta.go.jp/webapi/
[corp-token]: https://www.houjin-bangou.nta.go.jp/webapi/riyo-todokede/
[github]: https://github.com/fillin-inc/go-corp
[doc]: https://pkg.go.dev/github.com/fillin-inc/go-corp
[lambda]: https://aws.amazon.com/jp/lambda/
