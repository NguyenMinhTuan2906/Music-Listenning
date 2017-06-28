module ApplicationHelper
  def full_title page_title = ""
    base_title = t "listening_music"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end
end
