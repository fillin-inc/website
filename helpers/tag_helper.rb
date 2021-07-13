# frozen_string_literal: true

module TagHelper
  def tag_name(tag)
    return data.tags[tag] if data.tags[tag]

    tag
  end

  def tag_link_join(tags)
    return '' if tags.blank?

    tags.map { |tag| '<span class="tag-linl">' + link_to(tag_name(tag), tag_path(tag)) + '</span>' }.join(',')
  end
end
