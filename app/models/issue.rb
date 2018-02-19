class Issue < ApplicationRecord
  belongs_to :user

  enum state: [:open, :in_progress, :done]
end
