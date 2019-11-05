class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  def editable?
   if (Time.now - self.created_at < 10.minutes)
     return "true"
   else
     return "false"
   end
 end
end
