json.array! @reasons do |reason|
  json.extract! reason, :id, :human_trafficking, :not_legit, :sexual_content, :custom
end
