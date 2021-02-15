class UserBrief < ApplicationRecord
  belongs_to :user
  belongs_to :brief
end
