---
layout: false
---
site_url = "https://www.fillin-inc.com"
xml.instruct!
xml.urlset 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  sitemap.resources.select { |page| page.destination_path =~ /\.html/ }.each do |page|
    next if /(tech|releases)\/(tag|calendar).html/ =~ page.source_file
    next if /search\.html/ =~ page.source_file
    next if /inquiry\/thanks/ =~ page.source_file

    path = page.destination_path
    path = path.sub(/index\.html$/, '')
    xml.url do
      xml.loc URI.escape(File.join(site_url, path))
      xml.lastmod page.mtime.iso8601

      if /(tech|releases)\/.+/ =~ page.destination_path
        xml.changefreq page.data.changefreq || "weekly"
      else
        xml.changefreq page.data.changefreq || "monthly"
      end
      xml.priority page.data.priority || "0.5"
    end
  end
end
