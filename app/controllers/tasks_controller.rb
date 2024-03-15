class TasksController < ApplicationController

    # GET /tasks
    def index
        @tasks = Task.all 
        if params[:status_id].present?
            @tasks = @tasks.where(status_id: params[:status_id])
        end
        if params[:team_id].present?
            @tasks = @tasks.where(team_id: params[:team_id])
        end
        if params[:member_id].present?
            @tasks = @tasks.where(member_id: params[:member_id])
        end
        if params[:name].present?
            @tasks = @tasks.where('name LIKE ?', "%#{params[:name]}%")
        end
    end

    # GET /tasks/new
    def new
        @task = Task.new
    end

    # POST /tasks
    def create
        @task = Task.new
        @task.attributes = params.require(:task).permit(:name, :team_id, :member_id, :status_id, :memo, :start_date, :complete_date)
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
        @task.attributes = params.require(:task).permit(:name, :team_id, :member_id, :status_id, :memo, :start_date, :complete_date)
        @task.save
        redirect_to :tasks
    end

    # DELETE /tasks/:id
    def destroy
        @task = Task.find params[:id]
        @task.destroy
        redirect_to :tasks
    end

    # GET /tasks/completed
    def complete
        @tasks = Task.all
        @tasks_by_team = Task.all.group_by { |task| task.team.name }
    end
end
