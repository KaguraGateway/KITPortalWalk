class DeviseRemoveAdminConfirmable < ActiveRecord::Migration[7.0]
  def change
    remove_column :admins, :confirmation_token, :string
    remove_column :admins, :confirmed_at, :datetime
    remove_column :admins, :confirmation_sent_at, :datetime
    remove_column :admins, :unconfirmed_email, :string
  end
end
