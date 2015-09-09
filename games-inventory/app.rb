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
    @game = Game.new
    erb(:"games/new")
  end
 
  # create
  post "/games" do
    @game = Game.new(params[:game])
    if @game.save
      redirect("/games/#{@game.id}")
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
  post "games/:id" do
    @game = Game.find(params[:id])
    if @game.update_attributes(params[:game])
      redirect("games/#{@game.id}")
    else
      erb(:"games/edit")
    end
  end
  
  # delete
  post "/games/:id/delete" do
    @game = Game.find(params[:id])
    if @game.destroy
      redirect("/games")
    else 
      redirect("/games/#{@game.id}")
    end
  end

end