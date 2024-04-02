class CommentsController < ApplicationController
  before_action :set_task

  def new
    @comment = @task.comments.build
  end
  
  def edit
    @comment = @task.comments.find(params[:id])
  end
  
  def create
    @comment = @task.comments.build(comment_params)
    @comment.user_id = @task.user_id  # Устанавливаем user_id комментария равным user_id задачи
    if @comment.save
      redirect_to @task, notice: 'Комментарий успешно добавлен.'
    else
      render 'tasks/show'
    end
  end

  def update
    @comment = @task.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @task, notice: 'Комментарий успешно обновлен.'
    else
      render 'tasks/show'
    end
  end
  def destroy
   
    @comment = @task.comments.find(params[:id])
    @comment.destroy
    redirect_to @task, notice: 'Комментарий успешно удален.'
  end

  def show
    @comment = @task.comments.find(params[:id])
  end
  
  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end


  
  