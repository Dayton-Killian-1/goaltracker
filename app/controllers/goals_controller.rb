class GoalsController < ApplicationController

  def index
    matching_goals = Goal.all
    @list_of_user_goals = matching_goals.where({ :user_id => 1 })
    all_nonuser_goals = matching_goals.where.not({ :user_id => 1})
    @nonuser_goals = all_nonuser_goals.where({ :public => 1 })
    render({ :template => "goal_templates/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_goals = Goal.where({ :id => the_id })
    @the_goal = matching_goals.at(0)

    render({ :template => "goal_templates/show.html.erb" })
  end

  def new_goal
    render({ :template => "goal_templates/new.html.erb"})
  end

end