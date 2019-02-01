class List < ApplicationRecord
  has_many :tasks
    validates :name, presence: true,
                    length: { minimum: 5 }
end
