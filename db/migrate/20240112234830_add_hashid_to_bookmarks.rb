class AddHashidToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_column :bookmarks, :hashid, :string
  end
end
