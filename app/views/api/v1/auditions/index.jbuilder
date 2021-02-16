json.array! @auditions do |audition|
  json.extract! audition, :id, :video, :title, :author, :title
end
