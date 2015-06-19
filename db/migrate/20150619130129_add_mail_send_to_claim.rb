class AddMailSendToClaim < ActiveRecord::Migration
  def change
    add_column :claims, :mailSend, :boolean
  end
end
