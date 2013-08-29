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
end
