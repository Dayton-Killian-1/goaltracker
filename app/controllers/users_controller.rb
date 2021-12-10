class UsersController < ApplicationController

  def new_registration_form
    render({ :template => "user_templates/signup_form.html.erb"})
  end

  def create
    user = User.new

    user.name = params.fetch("input_username")
    user.password = params.fetch("input_password")
    user.password_confirmation = params.fetch("input_password_confirmation")
    user.phone = params.fetch("input_phonenum")

    save_status = user.save

    if save_status == true
      redirect_to("/users/#{user.username}", { :notice => "Thanks for signing up, " + user.name + "! Let's hit some goals!" })
    else
      redirect_to("/user_sign_up")
    end
  end

  def show
    the_username = params.fetch("the_username")
    @user = User.where({ :name => the_username }).at(0)

    render({ :template => "user_templates/show.html.erb" })
  end

  def index
    @users = User.all.order({ :name => :asc })

    render({ :template => "user_templates/index.html" })
  end
end