class Wiki < ApplicationRecord
  has_many :collaborators
  has_many :users, through: :collaborators

  belongs_to :user

  def owner
    self.user
  end

  def publicly_visible?
    true if self.private == false
  end

end
