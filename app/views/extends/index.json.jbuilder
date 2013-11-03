json.array!(@extends) do |extend|
  json.extract! extend, :body, :user_id
  json.url extend_url(extend, format: :json)
end
