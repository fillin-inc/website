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

activate :robots,
  :rules => [
    {
      user_agent: '*',
      allow: %w(/),
      disallow: %w(/inquiry/thanks/ /inquiry/thanks/index.html),
    }
  ],
  :sitemap => 'https://www.fillin-inc.com/sitemap.xml'

activate :directory_indexes
activate :generator_tag
activate :vcs_time
activate :gzip
activate :asset_hash

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true, tables: true, autolink: true

activate :external_pipeline,
  name: :webpack,
  command: build? ? './node_modules/webpack/bin/webpack.js --bail' : './node_modules/webpack/bin/webpack.js --watch -d',
  source: '.tmp/dist',
  latency: 1

configure :build do
  ignore '/stylesheets/vendor/bulma/*'
  ignore '/stylesheets/vendor/font-awesome/scss/*'

  activate :minify_css
  activate :minify_javascript
end

activate :s3_sync do |s3|
  s3.region = 'ap-northeast-1'
  s3.index_document = 'index.html'
  s3.error_document = '404/index.html'
end
default_caching_policy max_age: (60 * 60 * 24 * 365), public: true, must_revalidate: true
caching_policy 'text/html', max_age: 60 * 10
caching_policy 'text/plain', max_age: 60 * 10
caching_policy 'application/xml', max_age: 60 * 10
