require 'spec_helper'
describe "user creates todo" do
  it "creates a todo with a description" do
    # Arrange
    visit new_todo_path
    fill_in :todo_description, with: "Do the Dishes... Please"

    # Act
    click_link_or_button "Create Todo"

    # Assert
    todo = Todo.find_by_description("Do the Dishes... Please")
    todo.should_not be_nil

    expect(page).to have_content(todo.description)
  end

  context "with tags" do
    it "creates a todo with tags" do
      visit new_todo_path
      fill_in :todo_description, with: "Do the Dishes... Please"
      fill_in :todo_tags, with: "this-is-a-tag and-this-is-another-tag"

      # Act
      click_link_or_button "Create Todo"

      # Assert
      todo = Todo.find_by_description("Do the Dishes... Please")
      todo.should_not be_nil
      todo.tags.should include "this-is-a-tag"
      todo.tags.should include "and-this-is-another-tag"

      expect(page).to have_content(todo.description)
    end
  end
end
