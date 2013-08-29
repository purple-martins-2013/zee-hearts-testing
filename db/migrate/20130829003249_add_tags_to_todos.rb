class AddTagsToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :tags, :text, { default: "" }
  end
end
