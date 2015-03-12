module Teamwork
  class XlsCell < ActiveRecord::Base
    belongs_to :table, class_name: 'Teamwork::XlsTable', foreign_key: :table_id
  end
end
