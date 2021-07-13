xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  site_url = "https://www.fillin-inc.com"
  xml.title "リリース一覧"
  xml.id URI.join(site_url, blog(:releases).options.prefix.to_s)
  xml.link "href" => URI.join(site_url, blog(:releases).options.prefix.to_s)
  xml.link "href" => URI.join(site_url, current_page.path), "rel" => "self"
  xml.updated(blog(:releases).articles.first.date.to_time.iso8601) unless blog(:releases).articles.empty?
  xml.author { xml.name "株式会社フィルイン" }

  blog(:releases).articles[0..5].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => URI.join(site_url, article.url)
      xml.id URI.join(site_url, article.url)
      xml.published article.date.to_time.iso8601
      xml.updated File.mtime(article.source_file).iso8601
      xml.author '株式会社フィルイン'
      xml.content article.body, "type" => "html"
    end
  end
end
