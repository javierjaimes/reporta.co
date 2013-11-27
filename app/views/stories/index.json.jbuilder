json.status  true
json.current_page  @stories.current_page
json.total_pages  @stories.total_pages
json.data @stories do |story|
  json.id  story.id
  json.body story.body
  json.created_at story.created_at.to_s
  json.time_elapsed time_elapsed( story.created_at )
end
