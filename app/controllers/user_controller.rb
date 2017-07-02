class UserController < ApplicationController
  def create
      @user = User.new(params[:user])
      if @user.save
        UserNotifierMailer.send_signup_email(@user).deliver_now
        redirect_to(@user, :notice => 'User created')
      else
        render :action => 'new'
      end
  end
end
