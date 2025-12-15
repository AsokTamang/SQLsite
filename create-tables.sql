/*
 
 Create the cars table with the following columns:
 * id - SERIAL PRIMARY KEY
 * brand - TEXT
 * model - TEXT
 * year - INTEGER
 * price INTEGER,
 * color TEXT,
 * condition INTEGER,
 * sold BOOLEAN
 
 */
CREATE TABLE IF NOT EXISTS cars (
    id SERIAL PRIMARY KEY,
    brand TEXT,
    model TEXT,
    year INTEGER,
    price INTEGER,
    color TEXT,
    condition INTEGER,
    sold BOOLEAN
);
/*
 Create the dealerships table
 Include these columns:
 id - serial primary key
 city - text - NOT NULL
 state - char(2) - NOT NULL
 established - date - NOT NULL
 */
CREATE TABLE IF NOT EXISTS dealerships (
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    state CHAR(2) NOT NULL,
    established DATE NOT NULL
);
CREATE TABLE IF NOT EXISTS staff (
    id SERIAL primary key,
    dealership_id INTEGER NOT NULL REFERENCES dealerships(id),
    --here we are creating a foregin key ,which is the id of this table staff that references the id of the dealership
    name TEXT NOT NULL,
    role TEXT NOT NULL
);
/*
	Create the sold_cars table
		Include these columns:
			id - serial primary key - NOT NULL
			cars_id - integer - NOT NULL - foreign key referencing cars(id)
			seller - integer - NOT NULL - foreign key referencing staff(id)
			sold_date DATE - NOT NULL
			sold_price INTEGER - NOT NULL
*/
CREATE table if NOT EXISTS sold_cars
(id serial primary key,
cars_id integer NOT NULL references cars(id),
seller integer NOT NULL references staff(id),
sold_date date NOT NULL,
sold_price integer NOT NULL);