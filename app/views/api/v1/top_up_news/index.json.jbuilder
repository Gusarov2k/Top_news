json.array! @all_news do |news|
  json.id news.id
  json.title news.title
  json.announcement news.announcement
  json.context news.context
  json.created news.created
end
