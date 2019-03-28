require 'faraday'
require 'oj'

client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter Faraday.default_adapter
  config.token_auth('8277cd4c82260ca4bb1a70df62349cf6')
end

# create user
# response = client.post do |req|
#   req.url '/api/v1/users'
#   req.headers['Content-Type'] = 'application/json'
#   req.body = '{ "user": {"name": "test user"} }'
# end

# create top_news
response = client.post do |req|
  req.url '/api/v1/top_up_news'
  req.body = '{ "news": {"title": "Title",
                "announcement": "Announcement"
                "context": "Context"} }'
end

# id is it top_up_news
# response = client.delete do |req|
#   req.url '/api/v1/top_up_news/id'
#   req.headers['Content-Type'] = 'application/json'
# end

puts Oj.load(response.body)
puts response.status
