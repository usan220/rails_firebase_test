class HomeController < ApplicationController
	def index
		begin
      @auth = request.env["omniauth.auth"]
    rescue

    end
	end
end
