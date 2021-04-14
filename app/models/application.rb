class Application < ApplicationRecord
  belongs_to :user
  belongs_to :user_brief
end
