json.array! @private_auditions do |audition|
  json.extract! audition, :title, :video, :private_brief_id, :id
end
