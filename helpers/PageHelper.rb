# frozen_string_literal: true

module PageHelper
  def show_loader?
    current_page.data.loader || false
  end
end
