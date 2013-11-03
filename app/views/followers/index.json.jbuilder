json.array!(@followers) do |follower|
  json.extract! follower, :user_id, :story_id
  json.url follower_url(follower, format: :json)
end
