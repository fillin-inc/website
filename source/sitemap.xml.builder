---
layout: false
---
site_url = "https://www.fillin-inc.com"
xml.instruct!
xml.urlset 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  sitemap.resources.select { |page| page.destination_path =~ /\.html/ }.each do |page|
    next if page.is_a? Middleman::Sitemap::Extensions::RedirectResource
    next if page.data.sitemap_ignore

    xml.url do
      xml.loc URI.escape(File.join(site_url, page.url))
      xml.lastmod page.mtime.iso8601
      xml.priority page.data.priority || "0.5"
    end
  end
end
