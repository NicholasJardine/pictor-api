json.array! @private_invites do |invite|
  json.extract! invite, :private_brief_id, :id, :user_id, :status
end
