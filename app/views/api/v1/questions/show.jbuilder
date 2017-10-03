json.(@question, :id, :title)

json.asker @question.asker, :id, :name
json.answers @question.answers do |answer|
  json.id answer.id
  json.body answer.body
  json.provider answer.provider, :id, :name
end
