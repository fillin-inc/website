require 'slim'
require 'redcarpet'
require 'builder'

Time.zone = 'Tokyo'

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :blog do |blog|
  blog.name = 'releases'
  blog.prefix = blog.name
  blog.layout = blog.name
  blog.sources = 'articles/{year}-{month}-{day}-{title}.html'
  blog.default_extension = '.md'
  blog.summary_separator = /<!--more-->/
  blog.paginate = false
end

activate :directory_indexes
activate :syntax
activate :autoprefixer
activate :generator_tag
activate :gzip, exts: %w(.css .js .html .xml)

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true, tables: true, autolink: true

activate :external_pipeline,
  name: :webpack,
  command: build? ? './node_modules/webpack/bin/webpack.js --bail' : './node_modules/webpack/bin/webpack.js --watch -d',
  source: '.tmp/dist',
  latency: 1

configure :build do
  ignore '/stylesheets/vendor/*'

  activate :minify_css
  activate :minify_javascript
  activate :asset_hash

  activate :robots, rules: [
    {
      user_agent: '*',
      disallow: %w(/inquiry/thanks/ /inquiry/thanks/index.html)
    }
  ],
  sitemap: 'https://www.fillin-inc.com/sitemap/xml'
end

activate :s3_sync do |s3|
  s3.region = 'ap-northeast-1'
end
