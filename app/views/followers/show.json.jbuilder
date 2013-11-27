json.status true
json.object do
  json.extract! @follower, :id, :user_id, :story_id, :created_at, :updated_at
end
