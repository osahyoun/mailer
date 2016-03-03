class List < ActiveRecord::Base
  self.table_name = 'public.lists'

  has_many :list_members
  has_many :members, through: :list_members
  
  validates_presence_of :name
end
