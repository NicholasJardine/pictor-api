class Acceptance < ApplicationRecord
  belongs_to :user
  belongs_to :private_invite
end
