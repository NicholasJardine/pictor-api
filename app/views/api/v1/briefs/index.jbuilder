json.array! @briefs do |brief|
  json.extract! brief, :id, :name, :gender, :ethnicity, :wants
end
