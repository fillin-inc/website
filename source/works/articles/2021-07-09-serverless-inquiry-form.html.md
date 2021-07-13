---
title: サーバレスお問い合わせフォーム改修
date: 2021-07-09
tags:
    - in-house-development
    - aws-lambda
    - amazon-api-gateway
cover: images/works/2021-07-09/inquiry-form.jpg
ogp_image: images/works/2021-07-09/inquiry-form.jpg
---

当サイトのお問い合わせフォームを [Google フォーム](https://www.google.com/intl/ja_jp/forms/about/) から [AWS Lambda](https://aws.amazon.com/jp/lambda/) + [Amazon API Gateway](https://aws.amazon.com/jp/api-gateway/) を組み合わせたサーバレス実装へ改修しました。

<!--more-->

### 改修の目的

Google フォームを利用した場合, お問い合わせを受信してから確認するまでの間に大きなタイムラグがありました。場合によってはお問い合わせの返信までに数日を要してしまう場合もあり Web サイトの運用上問題がありました。

今回の改修では次の要件を満たすように設計ならびに実装を行っています。

1. お問い合わせ発生時に [Slack](https://slack.com/intl/ja-jp/) に通知が行われること
1. Slack が不調で通知ができなかった場合にもお問い合わせ内容が確認できること
1. お問い合わせ内容データは高いセキュリティ環境で補完されること

並行してサーバレス実装による技術検証を目的とした構成で実装を行っています。

### 改修方法

![構成図](images/works/2021-07-09/diagram.jpg)

- [AWS Lambda](https://aws.amazon.com/jp/lambda/) + [Amazon API Gateway](https://aws.amazon.com/jp/api-gateway/) を組み合わせたサーバレス構成
- お問い合わせ内容は [Amazon S3](https://aws.amazon.com/jp/s3/) へ暗号化の上保存
- [Slack](https://slack.com/intl/ja_JP) へ通知

### その他技術要素

- [Terraform](https://www.terraform.io/) による構成管理([Infrastructure as Code](https://ja.wikipedia.org/wiki/Infrastructure_as_Code))
- AWS Lambda の関数は Docker イメージベースで Go 言語を利用
- 副産物として GitHub Package に Go 言語のベースイメージを公開: https://github.com/fillin-inc/docker-go/pkgs/container/go
