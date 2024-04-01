class CommentsController < ApplicationController
    before_action :set_task
  
    def create
      @comment = @task.comments.new(comment_params)
      if @comment.save
        redirect_to @task
      else
        # обработка ошибок
      end
    end
  
    def edit
      @comment = @task.comments.find(params[:id])
    end
  
    def update
      @comment = @task.comments.find(params[:id])
      if @comment.update(comment_params)
        redirect_to @task
      else
        # обработка ошибок
      end
    end
  
    def destroy
      @comment = @task.comments.find(params[:id])
      @comment.destroy
      redirect_to @task
    end
  
    private
  
    def set_task
      @task = Task.find(params[:task_id])
    end
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  
  