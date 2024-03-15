class TeamsController < ApplicationController
    
    def create
        @team = Team.new params.require(:team).permit(:name)
        @team.save!
        redirect_to members_path
    end
    
    def edit
        @team = Tram.find params[:id]
    end
      
    def update
        @team = Team.find params[:id]
        @team.attributes = params.require(:team).permit(:name)
        @team.save!
        redirect_to members_path
    end
end
