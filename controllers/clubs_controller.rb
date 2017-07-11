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
		@test = "test"

		erb :"clubs/index"	

	end

	get "/clubs/new" do

	# new

		erb :"clubs/new"

	end

	get "/:id" do

		# show

		erb :"clubs/show"
	end

	post "/" do

		club = Club.new
		club.name = params[:name]
		club.description = params[:description]
		club.rating = params[:rating]
		club.location = params[:location]

		club.save

		redirect "/"
		# create

	end

	get "/:id/edit" do 

		# edit

		erb :"clubs/edit"

	end

	put "/:id" do

		# update

	end
	
	delete "/:id"do

		# delete

	end
	


end
