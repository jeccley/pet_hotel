module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << 'Pet Hotel').join(' - ')
      end
    end
  end
end
