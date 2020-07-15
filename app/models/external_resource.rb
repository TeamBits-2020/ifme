# frozen_string_literal: true

class ExternalResource < ApplicationRecord
  validates :name, :link, :languages, presence: true
  validates :link, uniqueness: true
end
