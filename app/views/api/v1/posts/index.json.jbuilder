json.array! @posts do |post|
  json.extract! post, :id, :image, :caption
end
