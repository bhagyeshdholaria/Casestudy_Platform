class Casestudy < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :pages
  has_many :questions

  has_many :casestudy_users
  has_many :users, through: :casestudy_users

  has_many :traits, through: :questions # to identify all traits which can be assessed by this casestudy

  validates :name, presence: true
  validates :duration, presence: true
  validates :scale, presence: true, numericality: { greater_than_or_equal_to: 1, only_integer: true }
end
