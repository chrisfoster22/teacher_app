class ChangePwToText < ActiveRecord::Migration
  def change
    change_column :teachers, :password_digest, :text
  end
end
