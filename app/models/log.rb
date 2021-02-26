class Log < ApplicationRecord
  belongs_to :client
  has_one :record, dependent: :destroy
  accepts_nested_attributes_for :record
end
