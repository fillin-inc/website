module TitleHelpers
  def release_title(resource)
    base_title = '株式会社フィルイン -群馬でWebサービスをつくる会社-'
    case resource.source_file
    when /release\/tag.html/
      /tags\/(.+)\// =~ resource.destination_path
      "タグ #{$1} | #{base_title}"
    when /release\/calendar.html/
      /release\/(.+)\/index.html/ =~ resource.destination_path
      "アーカイブ #{$1.gsub('/', '-')} | #{base_title}"
    else
      if resource.respond_to?(:title)
        "#{resource.title} | #{base_title}"
      else
        "リリース一覧 | #{base_title}"
      end
    end
  end
end
