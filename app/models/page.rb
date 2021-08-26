class Page < ApplicationRecord
  belongs_to :casestudy

  validates_presence_of :body
end
