require 'spec_helper'

describe TodosController do
  describe "#create" do
    context "when I post with empty params" do
      it "renders the new post form with an empty post object" do
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
