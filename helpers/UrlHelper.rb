# frozen_string_literal: true

module UrlHelper
  def top?
    current_page.url == '/'
  end
end
