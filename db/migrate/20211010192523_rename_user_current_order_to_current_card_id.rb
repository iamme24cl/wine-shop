class RenameUserCurrentOrderToCurrentCardId < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :current_order, :current_card_id
  end
end
