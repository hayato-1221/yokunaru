class Log < ApplicationRecord
  belongs_to :client
  has_one :record
  accepts_nested_attributes_for :record
end
