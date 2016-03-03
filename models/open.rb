class Open < ActiveRecord::Base
  self.table_name = 'mailer.opens'

  belongs_to :mailing
  belongs_to :member
end
