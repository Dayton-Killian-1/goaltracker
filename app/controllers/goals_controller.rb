class GoalsController < ApplicationController

  def index
    matching_goals = Goal.all
    @list_of_user_goals = matching_goals.order({ :created_at => :desc })

    render({ :template => "goal_templates/index.html.erb" })
  end

end