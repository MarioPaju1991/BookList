class AddHashidToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :hashid, :string
  end
end
