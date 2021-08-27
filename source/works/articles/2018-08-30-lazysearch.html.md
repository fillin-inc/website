---
title: サイト内検索サービス「LazySearch」
date: 2018-08-30
description: 自社サービスとして静的サイトに対して検索機能を提供するサイト内検索サービスを開発しました。
tags:
    - ruby-on-rails
    - go
    - javascript
cover: images/works/2018-08-30/lazysearch.jpg
ogp_image: images/ogp/works/2018-08-39/cover.jpg
twitter_card:
    image: images/ogp/works/2021-07-09/cover.jpg
    type: summary_large_image
---

自社サービスとしてサイト内検索 API サービスを開発しました。<br>
※現在サービス自体はクローズし, 一部パッケージとして提供しています。

<!--more-->

### サービス概要

LazySearch は Web サイトを管理画面から登録することでサイト内検索の機能を Web API 経由で提供します。

- sitemap.xml または sitemapindex.xml をベースに検索対象のページを特定
- robots.txt の設定により特定ページの除外, 追加が可能
- HTML のタグに特定のクラス名を指定することで検索対象からの除外指定が可能
- 検索データの更新は Web API または管理画面から実行可能
- 軽量高速な Go 言語で開発されたクローラー & Web API

### 開発情報

- クローラー
    - Go 
    - 独自実装
- Web API
    - Go
    - net/http
- 管理画面
    - Ruby on Rails
        - Slim
        - Sass
        - minitest
    - Vue.js
- 実行環境
    - DigitalOcean
    - AWS
    - Terraform
    - Ansible
