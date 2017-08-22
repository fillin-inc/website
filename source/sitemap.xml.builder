---
layout: false
---
site_url = "https://www.fillin-inc.com"
xml.instruct!
xml.urlset 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  sitemap.resources.select { |page| page.destination_path =~ /\.html/ }.each do |page|
    next if %w(/404/ /inquiry/thanks/).include? page.url

    xml.url do
      xml.loc URI.escape(File.join(site_url, page.url))
      xml.lastmod page.mtime.iso8601
      xml.priority page.data.priority || "0.5"
    end
  end
end
