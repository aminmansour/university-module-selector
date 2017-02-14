class UsersController < ApplicationController

  # Display a list of all signed up users
  def index
    @users = User.all
  end

  # Displays signup form.
  # Signup forms will be posted to new instead of create to preserve /signup url.
  def new
    if user_params
      create
    else
      @user = User.new
    end
  end

  def create_by_admin
    # Instantiate a new object using form parameters
    @user = User.new(user_params)
    # Save the object
    if @user.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "You have successfully created #{@user.full_name} and it's privileges have been granted"
      redirect_to(users_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render(:new)

    end
  end

  # Handle signup form submission.
  # User level is set to Student.
  def create
    @user = User.new(user_params)
    @user.user_level = 3
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:success] = "Please check your email to activate your account."
      redirect_to @user
    else
      render 'new'
    end
  end

  # Shows the profile of a user.
  def show
  end

  def edit
    #! allows for template's form to be ready populated with the associated users data ready for modification by admin
    @user = User.find(params[:id])
  end

  def update
    # Find a  object using id parameters
    @user = User.find(params[:id])
    # Update the object
    if @user.update_attributes(user_params)
      # If save succeeds, redirect to the index action
      flash[:notice] = "Successfully updated "+ @user.full_name
      redirect_to(users_path) and return
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end


  def destroy
  end

  private
    def user_params
      if params[:user].blank?
        return nil
      end
      #!add params that want to be recognized by this application
      params.require(:user).permit(:first_name, :last_name, :email, :password, :username, :year_of_study,:user_level)
    end
end
