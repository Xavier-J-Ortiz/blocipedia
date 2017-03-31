class User < ActiveRecord::Base
  has_many :wikis
  has_many :collaborators
  has_many :shared_wikis, through: :collaborators, source: :wiki
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  after_initialize { self.role ||= :standard }

  enum role: [:standard, :premium, :admin]


end
