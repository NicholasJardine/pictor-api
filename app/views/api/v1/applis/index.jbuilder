json.array! @applis do |appli|
  json.extract! appli, :id, :status, :province, :user_brief_id, :user_id
end
