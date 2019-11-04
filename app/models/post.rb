# frozen_string_literal: true

class Post < ApplicationRecord
  default_scope { order(created_at: :desc) }

  has_many :likes, dependent: :destroy

  def editable?
    if Time.now - created_at < 10.minutes
      'true'
    else
      'false'
    end
  end
end
