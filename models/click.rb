class Click < ActiveRecord::Base
  self.table_name = 'mailer.clicks'

  belongs_to :mailing
  belongs_to :member
end
