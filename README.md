# 株式会社フィルイン Web サイト

このリポジトリは [株式会社フィルイン](https://www.fillin-inc.com) の Web サイト用リポジトリです。

## fillin-inc.com 構成

### 採用ツール

- 静的サイトジェネレータ
    - [Middleman](https://middlemanapp.com/jp/)
    - 拡張機能
        - [middleman-blog](https://github.com/middleman/middleman-blog)
        - [middleman-generator-tag](https://github.com/yterajima/middleman-generator-tag)
        - [middleman-s3_sync](https://github.com/fredjean/middleman-s3_sync)
- テンプレートエンジン 
    - [Slim](http://slim-lang.com/)
    - [redcarpet](https://github.com/vmg/redcarpet)
    - [builder](https://github.com/jimweirich/builder)
- JavaScript
    - [webpack](https://webpack.github.io/)
    - [Babel](https://babeljs.io/)
- お問い合わせ
    - AWS Lambda
    - AWS API Gateway

### サーバ環境

- DNS: AWS [Route53](https://aws.amazon.com/jp/route53/)
- Hosting: AWS [S3](https://aws.amazon.com/jp/s3/)
- CDN: AWS [CloudFront](https://aws.amazon.com/jp/cloudfront/)
- SSL証明書: AWS [Certification Manager](https://aws.amazon.com/jp/certificate-manager/)

## License

- 文章, 画像, 動画などのコンテンツの著作権については, 明記があるものを除き株式会社フィルインに帰属します。
- Middleman プロジェクトを構成する Ruby, Slim, builder コードについては MIT ライセンスです。ご活用ください。
- その他のライブラリなどは記載されたライセンスに従ってください。
