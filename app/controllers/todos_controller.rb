class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def create
    if params.has_key?(:todo)
      @todo = Todo.create(todo_params)
      redirect_to todos_path and return
    end
    @todo = Todo.new
    render :new
  end


  def index
    @todos = Todo.all
  end

  private
  def todo_params
    params.require(:todo).permit([:description])
  end
end
