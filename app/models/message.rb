class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  after_create_commit { broadcast_append_to room } #그냥 단수인 이유는 알겠는데, 왜 따옴표를 붙이지 않는거지?
end
