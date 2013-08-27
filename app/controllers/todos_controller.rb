class TodosController < ApplicationController
  def create
    if params.has_key?(:todo)
      Todo.create(todo_params)
      redirect_to todos_path and return
    end
    render :new
  end


  private
  def todo_params
    params.require(:todo).permit([:description])
  end
end
