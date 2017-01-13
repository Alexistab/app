class ChangeColumnPermissionLevelFromStringToInterger < ActiveRecord::Migration[5.0]
  def change
    remove_column :ussers, :permission_level, :string
    add_column :ussers, :permission_level, :integer, default: 1
  end
end
