class ChangeDataTelToAddress < ActiveRecord::Migration[6.0]
  def change
    change_column :addresses, :tel, :string
  end
end
