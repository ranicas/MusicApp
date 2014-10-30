class Track < ActiveRecord::Base
  validates :album, :ttype, presence: true
end
