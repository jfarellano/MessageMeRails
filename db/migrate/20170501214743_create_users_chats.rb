class CreateUsersChats < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :chats do |t|
      t.belongs_to :user, index: true
      t.belongs_to :chat, index: true
    end
  end
end
