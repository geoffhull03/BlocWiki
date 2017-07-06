class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :
  has_many :collaborators
  has_many :wikis, through: :collaborators
  before_save { self.role ||= :standard }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:standard, :premium, :admin]


end
