class GameSpot < Sinatra::Base

  # General route actions
  get "/" do
    redirect("/games")
  end

  # RESTful Artist Controller Actions
  # index
  get "/games" do
    @games = Game.all
    erb(:"games/index")
  end

  # new
  get "/games/new" do
    @new_game = Game.new
    erb(:"games/new")
  end
 
  # create
  post "/games" do
    @new_game = Game.new(params[:game])
    if @new_game
      redirect("/games/#{@new_game.id}")
    else
      erb(:"games/new")
    end
  end

  # show
  get "/games/:id" do
    @game = Game.find(params[:id])
    erb(:"games/show")
  end

  # edit
  get "games/:id/edit" do
    @game = Game.find(params[:id])
    erb(:"games/edit")
  end

  # update
  put "games/:id" do
    @game = Game.find(params[:id])
    if @game.update_attributes(params[:game])
      redirect("games/#{@game.id}")
    else
      erb(:"games/edit")
    end
  end
  
  # delete
  delete "/games/:id" do
    @game = Game.find(params[:id])
    if @game.destroy
      redirect("/games")
    else 
      redirect("/games/#{@game.id}")
    end
  end

end