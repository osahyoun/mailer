class Member < ActiveRecord::Base
  self.table_name = 'public.members'

  has_many :lists
end
