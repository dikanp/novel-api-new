class AddUserIdToNovels < ActiveRecord::Migration[6.1]
  def change
    add_column :novels, :user_id, :int
  end
end
