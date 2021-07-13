require 'slim'
require 'redcarpet'
require 'builder'

Time.zone = 'Tokyo'

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '/lp/*.html', layout: false

ignore '/images/icons/*'

data.redirects.each do |r|
  redirect r.from, to: 'https://www.fillin-inc.com/' + r.to
end

activate :blog do |blog|
  blog.name = 'releases'
  blog.prefix = blog.name
  blog.layout = blog.name
  blog.sources = 'articles/{year}-{month}-{day}-{title}.html'
  blog.default_extension = '.md'
  blog.summary_separator = /<!--more-->/
  blog.paginate = false
end

activate :blog do |blog|
  blog.name = 'works'
  blog.prefix = blog.name
  blog.layout = blog.name
  blog.sources = 'articles/{year}-{month}-{day}-{title}.html'
  blog.taglink = 'articles/{tag}.html'
  blog.default_extension = '.md'
  blog.summary_separator = /<!--more-->/
  blog.paginate = true
  blog.per_page = 5
end

activate :robots,
  :rules => [
    {
      user_agent: '*',
      allow: %w(/),
      disallow: %w(/404/ /inquiry/thanks/ /inquiry/thanks/index.html),
    }
  ],
  :sitemap => 'https://www.fillin-inc.com/sitemap.xml'

activate :directory_indexes
activate :generator_tag
activate :gzip
activate :asset_hash do |f|
  f.ignore = [/images\/ogp\/\S+\.(png|jpg|gif)/]
end

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true, tables: true, autolink: true

activate :external_pipeline,
  name: :webpack,
  command: build? ? 'npm run build' : 'npm run watch',
  source: '.tmp/dist',
  latency: 1

configure :build do
  activate :minify_css
end

activate :s3_sync do |s3|
  s3.region = 'ap-northeast-1'
  s3.index_document = 'index.html'
  s3.error_document = '404/index.html'
end
default_caching_policy max_age: (60 * 60 * 24 * 365), public: true, must_revalidate: true
caching_policy 'text/html', max_age: 60 * 10, public: true, must_revalidate: true
caching_policy 'text/plain', max_age: 60 * 10, public: true, must_revalidate: true
caching_policy 'application/xml', max_age: 60 * 10, public: true, must_revalidate: true
