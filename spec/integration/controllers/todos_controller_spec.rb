require 'spec_helper'

describe TodosController do
  describe "#new" do
    it "provides a @todo to the view" do
      get new_todo_path
      expect(assigns(:todo)).not_to be_persisted
    end
  end

  describe "#index" do
    it "provides all todos in @todos to the view" do
      todo = Todo.create(description: "Test")
      get todos_path
      expect(assigns(:todos)).to eq([todo])
    end
  end

  describe "#create" do
    context "when I post with empty params" do
      it "provides an empty todo" do
        post todos_path, {}
        expect(assigns(:todo)).not_to be_nil
      end

      it "renders the new post form" do
        post todos_path, {}
        expect(response).to render_template("new")
      end
    end

    context "when I post with a valid todo" do
      before {
        post todos_path, { todo: {
            description: "Awesome Thing to Do"
          }
        }
      }
      it "creates a post in the dayterbasers" do
        Todo.last.description.should eq "Awesome Thing to Do"
      end

      it "redirects to the index" do
        expect(response).to redirect_to(todos_path)
      end
    end
  end
end
