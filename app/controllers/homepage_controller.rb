class HomepageController < ActionController::Base
  respond_to :json, :html

  def show
    if params[:query]
      @user = Instagram.user_search(params[:query]).first
    end

    if params[:artist]
      @rockstar = Rockstar::Artist.new(params[:artist])
    end

    if @rockstar
      @tracks = @rockstar.top_tracks[0..9]
      @artist = @rockstar.name
    end

    if @user
      @photos = Instagram.user_recent_media(@user.id, {count: 6})
    end
  end
end