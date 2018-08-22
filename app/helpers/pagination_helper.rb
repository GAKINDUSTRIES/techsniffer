module PaginationHelper
  delegate :url_helpers, to: 'Rails.application.routes'

  def next_page(current_page, per_page, total)
    total_amount_of_pages = (total.to_f / per_page.to_f).ceil
    (total_amount_of_pages.to_i > current_page.to_i) ? true : false
  end

  def previous_page(current_page, per_page, total)
    current_page.to_i > 1 ? true : false
  end
end
