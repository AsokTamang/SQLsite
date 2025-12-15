import { PGlite } from "@electric-sql/pglite";
import fs from "fs";

(async () => {
  //IIFE Immediately invoked asynchronous function
  //this is known as immediately invoked async function
  const db = new PGlite(); //here we are creating a new instance of PGlite
  //here we are creating the table called CARS only if it doesnot exist
  //the below code executes the creation of a table with the table schema with their values
  const createtables = fs.readFileSync("create-tables.sql", "utf-8"); //here we are reading the query available in create-tables.sql file which is for creating different tables
  await db.exec(createtables);

  const populatetables = fs.readFileSync("populate-tables.sql", "utf-8"); //here the query of poupulating the tables is in the file called populate-tables
  await db.exec(populatetables); //then we execute the function of populating the tables
  
  const insertintocars=fs.readFileSync('insert-cars-data.sql','utf-8')
  await db.exec(insertintocars);
  const query = fs.readFileSync("query.sql", "utf8"); //so this code query is used for reading the file query.sql where we write down the sql commands
  const response = await db.query(query); //then we query the existing db that we just created using the sql command which is read in the variable query
  console.table(response.rows); //here we are consoling the rows of the response in a table
})();
