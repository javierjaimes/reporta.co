json.status true
json.id @story.id
json.body @story.body
json.created_at @story.created_at
json.following (@following.nil? == true)? false:@following.id
json.time_elapsed time_elapsed( @story.created_at )
json.user do
  json.id @story.user.id
  json.name @story.user.name
end
json.extends do
  json.current_page @extends.current_page
  json.total_pages @extends.total_pages
  json.data @extends do |extend|
    json.id extend.id
    json.body extend.body
    json.created_at extend.created_at
    json.time_elapsed time_elapsed(extend.created_at)
    json.user do
      json.id  extend.user.id
      json.name  extend.user.name
    end
  end
end

