json.array! @posts do |post|
  json.extract! post, :id, :image, :paragraph_1, :author, :title
end
