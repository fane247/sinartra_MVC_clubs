class Club

	attr_accessor :name, :description, :rating, :location

	def self.open_connection

		PG.connect(dbname: "music_site")

	end

	def self.hydrate record

		club = Club.new

		club.name = record['name'];
		club.description = record['description']
		club.rating = record['rating']
		club.rating = record['location']

		club

	end

	def self.all

		conn = self.open_connection
		sql = "
		SELECT * FROM clubs;
		"
		results = conn.exec(sql)

		clubs = results.map do |club|  

			self.hydrate(club)

		end

		clubs

	end


	def save

		conn = self.open_connection
		sql = "
		INSERT INTO clubs
		(name , description, rating, location)
		values('#{self.name}','#{self.description}','#{self.rating}','#{self.location}');
		"

	end

	def self.find(id)

		conn = self.open_connection
		sql = "
		SELECT * FROM clubs
		WHERE id=#{id};"

	end






end