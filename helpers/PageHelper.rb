# frozen_string_literal: true

module PageHelper
  def show_loader?
    current_page.data.loader || false
  end

  def hide_inquiry?
    current_page.data.inquiry == false
  end
end
