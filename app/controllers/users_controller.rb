class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/list"})
  end
  
  def show
    url_username = params["path_username"]
    matching_relation = User.where({ :username => url_username})
    @user = matching_relation.first
    if @user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show"})
    end
  end

  def create
    username = params["input_username"]
    new_user = User.new
    new_user.username = username
    new_user.save
    redirect_to("/users/#{new_user.username}")
  end
end
