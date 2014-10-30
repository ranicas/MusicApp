class Album < ActiveRecord::Base
  validates :band, :ttype, presence: true
  
  belongs_to :band
  has_many :tracks, dependent: :destroy
end
