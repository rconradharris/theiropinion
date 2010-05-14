# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def linky_tags(tags, opts={})
    opts[:separator] ||= ' '
    tags.map { |t| link_to t.name, tag_path(t.name), :class => 'tag_link' }.join opts[:separator]
  end

  def pub_date(date)
    date.strftime("%b %Y")
  end
end
