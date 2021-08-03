xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  site_url = "https://www.fillin-inc.com"
  xml.title "ブログ記事一覧"
  xml.id URI.join(site_url, blog(:blogs).options.prefix.to_s + '/')
  xml.link "href" => URI.join(site_url, blog(:blogs).options.prefix.to_s + '/')
  xml.link "href" => URI.join(site_url, current_page.path), "rel" => "self"
  xml.updated(blog(:blogs).articles.first.date.to_time.iso8601) unless blog(:blogs).articles.empty?
  xml.author { xml.name "株式会社フィルイン" }

  blog(:blogs).articles[0..4].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => URI.join(site_url, article.url)
      xml.id URI.join(site_url, article.url)
      xml.published article.date.to_time.iso8601
      time = `git log -1 --pretty="format:%ci" #{article.source_file}`
      xml.updated time.present? ? Time.parse(time).iso8601 : File.mtime(article.source_file).iso8601
      xml.author {
        xml.name "株式会社フィルイン"
        xml.email "info@fillin-inc.com"
      }
      xml.logo URI.join(site_url, article.data.cover || '/images/ogp/ogp.jpg')
      xml.content article.summary(200, '...'), "type" => "html"
    end
  end
end
