class ChangeTitleInBlogs < ActiveRecord::Migration[7.1]
  def change
    change_column :blogs, :title, :string, null: false
  end
end
