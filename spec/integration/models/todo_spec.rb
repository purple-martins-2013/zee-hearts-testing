require 'spec_helper'

describe Todo do
  subject(:todo) { Todo.new(tags: tags) }
  describe "#tags" do
    context "with spaces" do
      let(:tags) { "hi mom" }
      it "parses tags with spaces" do
        todo.tags[0].should eq "hi"
        todo.tags[1].should eq "mom"
      end
    end

    context "with commas" do
      let(:tags) { "hello,father" }
      it "parses tags with commas" do
        todo.tags[0].should eq "hello"
        todo.tags[1].should eq "father"
      end
    end

    context "with commas" do
      let(:tags) { "guten-tag, cousin" }
      it "parses tags with commas" do
        todo.tags[0].should eq "guten-tag"
        todo.tags[1].should eq "cousin"
      end
    end

    context "with a crazy collection of tags" do
      let(:tags) { "  , , , dt, " }
      it "removes all empty tags" do
        todo.tags[0].should eq "dt"
      end
    end

  end
end

