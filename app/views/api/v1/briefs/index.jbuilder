json.array! @briefs do |brief|
  json.extract! brief, :wants, :needs, :id, :ethnicity, :gender, :name, :traits, :language, :flaws, :arc_summary, :province, :scene, :title, :user_id
end
