json.array! @posts do |post|
  json.extract! post, :title, :description, :id, :image, :paragraph_1, :paragraph_2, :paragraph_3, :paragraph_4, :paragraph_5, :paragraph_6, :author, :user_id
end
