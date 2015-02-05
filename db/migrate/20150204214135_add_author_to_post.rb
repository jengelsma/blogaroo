class AddAuthorToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :author, index: true
    add_foreign_key :posts, :authors
  end
end
