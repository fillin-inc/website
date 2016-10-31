require 'slim'
require 'redcarpet'
require 'builder'

Time.zone = 'Tokyo'

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :directory_indexes
activate :syntax
activate :autoprefixer
activate :generator_tag
activate :gzip, exts: %w(.css .js .html .xml)

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true, tables: true, autolink: true

configure :build do
  activate :minify_css
  activate :minify_javascript
end

#activate :s3_sync do |s3|
#  s3.region = 'ap-northeast-1'
#end
