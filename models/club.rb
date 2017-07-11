class Club

	attr_accessor :id, :name, :description, :rating, :location

	def self.open_connection

		PG.connect(dbname: "music_site")

	end

	def self.hydrate record

		club = Club.new

		club.id = record['id']
		club.name = record['name']
		club.description = record['description']
		club.rating = record['rating']
		club.location = record['location']

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

		conn = Club.open_connection
		sql = "
		INSERT INTO clubs
		(name , description, rating, location)
		values('#{self.name}','#{self.description}','#{self.rating}','#{self.location}');
		"
		conn.exec(sql)

	end

	def self.find(id)

		conn = self.open_connection
		sql = "
		SELECT * FROM clubs
		WHERE id=#{id};"

		results = conn.exec(sql)

		club = self.hydrate(results[0])


	end

	def update

		conn = Club.open_connection
		sql	= "
		UPDATE clubs
		set name= '#{self.name}', description='#{self.description}', rating='#{self.rating}', location='#{self.location}'
		WHERE id=#{self.id}
		"
		conn.exec(sql)


	end

	def self.delete(id)

		conn = self.open_connection
		sql = "
		DELETE FROM clubs
		WHERE id = #{id}
		"
		conn.exec(sql)
		
	end



end