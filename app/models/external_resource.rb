# frozen_string_literal: true

class ExternalResource < ApplicationRecord
  validates :name, presence: true
  validates :link, presence: true, uniqueness: true
  validates :languages, presence: true
end
