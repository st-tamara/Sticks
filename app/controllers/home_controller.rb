class HomeController < ApplicationController
  def index
  	if params.key?(:win)
  		@id=params[:id]
  		game=Game.find(@id)
  		game.steps=params[:c].to_i
  		game.winner=params[:win]
  		game.save
      
        if params[:win]=="Server"
        detail = Detail.new player: "Browser", sticks: 1, take: 1, game_id: game.id
        detail.save
       end 
  		if (game.save)
  			redirect_to ('/games/' + params[:id])
  		end
  	end
  	@games = Game.all
    @details = Detail.all
  end

  def second 
  end

  def redirector
  	if params[:id].to_i==0
  		game=Game.new
      game.save
      if params[:b].to_i!=0
        detail=Detail.new player:"Browser", sticks: (params[:a].to_i + params[:b].to_i), take: params[:b].to_i, game_id:game.id
        detail.save
      end

  	else
  		@gameid=params[:id]
      game=Game.find(@gameid)
      detail=Detail.new player:"Browser", sticks: (params[:a].to_i + params[:b].to_i), take: params[:b].to_i, game_id:game.id
      detail.save

      
    end

    	

  	@k=params[:a].to_i
  	@c=params[:c].to_i
  	@c=@c+1

  	if (@k==3) 
  	@b=2
  	elsif ((@k==2)||(@k==1))
  	@b=1
  	else 
  	@b=rand(3) + 1
  	end

    detail=Detail.new player: "Server", sticks: @k, take: @b, game_id: game.id
    detail.save

	redirect_to ('/home/second/'+ '?a=' + (@k-@b).to_s + "&b=" + @b.to_s + "&c=" + @c.to_s + "&id=" + game.id.to_s )
	end
  	

end
