class Post < ApplicationRecord
  default_scope {order(created_at: :desc)}

  def editable?
   if (Time.now - self.created_at < 10.minutes)
     return "true"
   else
     return "false"
   end
 end
end
