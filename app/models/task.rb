class Task < ApplicationRecord
  belongs_to :list
  validates :task, presence: true,
                  length: { minimum: 4 }
  scope(:not_done, -> do
  where({:done => false})
  end)

  scope(:done, -> do
  where({:done => true})
  end)

end
