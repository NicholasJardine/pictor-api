json.array! @acceptances do |acceptance|
  json.extract! acceptance, :id, :status, :user_id, :private_invite_id
end
