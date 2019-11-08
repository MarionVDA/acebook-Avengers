# frozen_string_literal: true

<<<<<<< HEAD:db/migrate/20191101120022_create_posts.rb
=======
# rubocop:todo Style/Documentation
>>>>>>> jordan2:db/migrate/20170526114520_create_posts.rb
class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :message
      t.timestamps
    end
  end
end
# rubocop:enable Style/Documentation
