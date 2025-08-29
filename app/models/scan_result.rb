class ScanResult < ApplicationRecord
  serialize :data, JSON

  validates :scan_type, presence: true
  validates :target, presence: true
end
