module Teamwork
  class XlsTable < ActiveRecord::Base
    belongs_to :file, class_name: 'Teamwork::XlsFile', foreign_key: :file_id
    has_many :cells, class_name: 'Teamwork::XlsCell'
  end
end
