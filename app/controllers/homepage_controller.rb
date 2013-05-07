class HomepageController < ActionController::Base
  respond_to :json, :html

  def show
    if params[:query]
      @user = Instagram.user_search(params[:query]).first
    end

    if @user
      @photos = Instagram.user_recent_media(@user.id)[0..5]
    end
  end
end