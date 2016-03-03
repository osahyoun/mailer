class Link < ActiveRecord::Base
  self.table_name = 'mailer.links'

  belongs_to :mailing
end
