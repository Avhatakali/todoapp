class TasksController < ApplicationController

    def index
      @tasks = Task.all
      @list = List.find(params[:list_id])

    end

    def show
        @task = Task.find(params[:id])
        @list = @task.list
    end

    def new
        @list = List.find(params[:list_id])
        @task = @list.tasks.new
    end

    def edit
        @task = Task.find(params[:id])
        @list = @task.list
    end

    def create
        @list = List.find(params[:list_id])
        @task = @list.tasks.create(task_params)
        if @task.save
           redirect_to list_tasks_path(@task)
         else
           render 'new'
         end
    end

    def update
        @task = Task.find(params[:id])
        @list = @task.list

        if @task.update(task_params)
           redirect_to @list
        else
           render 'edit'
        end
    end

    private
      def task_params
        params.require(:task).permit(:task, :done)
      end

end
