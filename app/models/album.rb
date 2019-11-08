# frozen_string_literal: true

class Album < ApplicationRecord
  default_scope { order(created_at: :asc) }
  has_many :photos, dependent: :destroy
end
