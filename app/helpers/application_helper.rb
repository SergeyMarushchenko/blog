module ApplicationHelper
  #returns full page title
  def full_title(page_title)
    base_title = "Sergey's Blog"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

end
