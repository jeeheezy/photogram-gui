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
end
