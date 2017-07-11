class ClubsController < Sinatra::Base


	# sets root as the parent-directory of the current file
	set :root, File.join(File.dirname(__FILE__), '..')

	# sets the view directory correctly
	set :views, Proc.new { File.join(root, "views") } 

	configure :development do
		register Sinatra::Reloader
	end

	get "/clubs" do
		
		# index
		@clubs = Club.all

		erb :"clubs/index"	

	end

	get "/clubs/new" do

	# new

		erb :"clubs/new"

	end

	get "/clubs/:id" do

		# show

		id = params[:id].to_i

		@club = Club.find(id)

		erb :"clubs/show"


	end

	post "/clubs" do

		club = Club.new
		club.name = params[:name]
		club.description = params[:description]
		club.rating = params[:rating]
		club.location = params[:location]

		club.save

		redirect "/clubs"
		# create

	end

	get "/clubs/:id/edit" do 

		# edit

		id = params[:id]
		@club = Club.find(id)





		erb :"clubs/edit"

	end

	put "/clubs/:id" do

		id = params[:id].to_i

		club = Club.find(id)

		club.name = params[:name]
		club.description = params[:description]
		club.rating = params[:rating].to_i
		club.location = params[:location]

		club.update

		redirect "/clubs"

		# update

	end
	
	delete "/clubs/:id"do

		# delete

	end
	


end
