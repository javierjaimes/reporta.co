json.status true
json.data  @stories do |story|
  json.id  story.id
  json.body story.body
  json.user do 
    json.name story.user.name
  end
end
