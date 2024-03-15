class MembersController < ApplicationController
    def index
        @members = Member.all
        @member = Member.new
        @teams = Team.all
        @team = Team.new
    end
    
    def create
        @member = Member.new params.require(:member).permit(:name, :team_id)
        @member.save!
        redirect_to members_path
    end
    
    def edit
        @member = Member.find params[:id]
    end
      
    def update
        @member = Member.find params[:id]
        @member.attributes = params.require(:member).permit(:name, :team_id)
        @member.save!
        redirect_to members_path
    end
end
