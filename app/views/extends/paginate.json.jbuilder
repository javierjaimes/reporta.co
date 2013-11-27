json.status  true
json.current_page @extends.current_page
json.total_pages @extends.total_pages

json.data  @extends do |extend|
  json.id  extend.id
  json.body extend.body
  json.created_at extend.created_at.to_s
  json.time_elapsed time_elapsed( extend.created_at )
  json.user do 
    json.name extend.user.name
    json.id extend.user.id
  end
end

