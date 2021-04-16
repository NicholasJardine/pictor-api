json.array! @auditions do |audition|
  json.extract! audition, :title, :video, :brief_id, :id
end
