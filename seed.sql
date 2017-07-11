DROP TABLE IF EXISTS clubs;

CREATE TABLE clubs (

  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255),
  rating INT,
  location TEXT
  image TEXT
);

INSERT INTO clubs (name , description, rating, location, image) VALUES ('Fabric' , 'Used to be a be a pretty banging club until they got shutdown and could only reopen if they stopped doing DNB nights and made sure that the dancefloor was illuminated like a football pitch',3,'Farringdon','/images/fabric.jpg');

INSERT INTO clubs (name , description, rating, location) VALUES ('The End' , 'A classic venue, which has unfortunately been shutdown',3 ,'Tottenham Court Road');

INSERT INTO clubs (name , description, rating, location) VALUES ('Electric' , 'A coverted theatre which caters mostly to electronic music',5 ,'Brixton');
