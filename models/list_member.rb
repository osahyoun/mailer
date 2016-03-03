class ListMember < ActiveRecord::Base
  self.table_name = 'public.list_members'

  belongs_to :member
  belongs_to :list
  
  validates_uniqueness_of :list_id, :scope => [:member_id] 
end
