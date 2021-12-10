class UsersController < ApplicationController


  def verify
    un = params.fetch("input_username")
    pw = params.fetch("input_password")

    user = User.where({ :name => un }).at(0)

    if user == nil
      redirect_to("/user_sign_in", { :alert => "Sorry, we can't find an account with that name. Please try again or sign up for a free account."})
    else
      if user.authenticate(pw)
        session.store(:user_id, user.id)
        redirect_to("/", :notice => "Welcome Back, " + user.name + "! Let's get after it!")
      else 
        redirect_to("/user_sign_in", { :alert => "Sorry, that password might not be correct."})
      end
    end
  end

  def new_registration_form
    render({ :template => "user_templates/signup_form.html.erb"})
  end

  def new_session_form
    render({ :template => "user_templates/signin_form.html.erb"})
  end

  def create
    user = User.new

    user.name = params.fetch("input_username")
    user.password = params.fetch("input_password")
    user.password_confirmation = params.fetch("input_password_confirmation")
    user.phone = params.fetch("input_phonenum")

    save_status = user.save

    if save_status == true
      session.store(:user_id, user.id)

      redirect_to("/goals", { :notice => "Thanks for signing up, " + user.name + "! Let's hit some goals!" })
    else
      redirect_to("/user_sign_up", { :alert => user.errors.full_messages.to_sentence })
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

  def remove_cookies
    reset_session

    redirect_to("/", { :notice => "Thanks for checking in! Go get 'em!"})
  end



end