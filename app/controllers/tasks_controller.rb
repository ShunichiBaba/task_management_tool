class TasksController < ApplicationController

    # GET /tasks
    def index
        @tasks = Task.includes(member: :team).all
    end

    # GET /tasks/new
    def new
        @task = Task.new
    end

    # POST /tasks
    def create
        @task = Task.new
        @task.attributes = params.require(:task).permit(:name, :team_id, :member_id, :status, :memo, :start_date, :complete_date)
        @task.save
        redirect_to :tasks
    end
    
    # GET /tasks/:id
    def show
        @task = Task.find params[:id]
    end

    # GET /tasks/:id/edit
    def edit
        @task = Task.find params[:id]
    end

    # PATCH /tasks/:id
    def update
        @task = Task.find params[:id]
        @task.attributes = params.require(:task).permit(:name, :team_id, :member_id, :status, :memo, :start_date, :complete_date)
        @task.save
        redirect_to :tasks
    end

    # DELETE /tasks/:id
    def destroy
        @task = Task.find params[:id]
        @task.destroy
        redirect_to :tasks
    end
end
