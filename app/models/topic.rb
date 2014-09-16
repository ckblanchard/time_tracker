class Topic < ActiveRecord::Base
  has_many :entries
end
