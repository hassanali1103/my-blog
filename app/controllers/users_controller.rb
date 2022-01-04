class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @articles = @user.articles
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_param)
        if @user.save
            flash[:notice]= "Welcome to My Blog, #{@user.username}!"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_param)
            flash[:notice] = "Account updated successfully"
            redirect_to articles_path
        else
            render 'edit'
        end

    end

    private

    def user_param
        params.require(:user).permit(:username, :email, :password)
    end

    
end
