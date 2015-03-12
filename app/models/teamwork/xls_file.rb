module Teamwork
  class XlsFile < ActiveRecord::Base
    has_many :tables, class_name: 'Teamwork::XlsTable'
  end
end
