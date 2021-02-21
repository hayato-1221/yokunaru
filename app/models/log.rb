class Log < ApplicationRecord
  belongs_to :client
  has_one :record
end
