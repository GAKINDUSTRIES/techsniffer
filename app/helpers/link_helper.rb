module LinkHelper
  delegate :url_helpers, to: 'Rails.application.routes'

  def formatted_link(tab)
    if request.path == url_helpers.root_path
      "##{tab}"
    else
      "#{root_path}##{tab}"
    end
  end
end
