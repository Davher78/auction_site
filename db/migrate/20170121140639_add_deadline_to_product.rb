class AddDeadlineToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :deadline, :string
  end
end
