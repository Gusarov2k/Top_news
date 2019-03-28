class Rack::Attack
  safelist('allow from localhost') do |req|
    # Requests are allowed if the return value is truthy
    req.ip == '127.0.0.1' || req.ip == '::1'
  end

  throttle('req/ip', limit: 5, period: 1.second, &:ip)

  self.throttled_response = lambda { |env|
    retry_after = (env['rack.attack.match_data'] || {})[:period]
    [
      429,
      { 'Content-Type' => 'application/json', 'Retry-After' => retry_after.to_s },
      [{ error: 'Throttle limit reached. Retry later.' }.to_json],
    ]
  }
end
