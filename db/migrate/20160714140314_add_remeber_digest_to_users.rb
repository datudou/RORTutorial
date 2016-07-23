class AddRemeberDigestToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :remeber_digest, :string
  end
end
