# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  default_scope { order(created_at: :asc) }

  def editable?
    if Time.now - created_at < 10.minutes
      'true'
    else
      'false'
    end
  end
end
