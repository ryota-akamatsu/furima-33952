class UsersController < ApplicationController
def new
  @user = User.all

end
end
