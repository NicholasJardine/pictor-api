class PbReason < ApplicationRecord
  belongs_to :user
  belongs_to :private_brief
end
