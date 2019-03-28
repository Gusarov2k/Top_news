class TopUpNews < ApplicationRecord
  validates :title, :announcement, :context, presence: true
end
