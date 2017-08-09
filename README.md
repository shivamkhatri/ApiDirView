# README

Welcome to the RESTful APIs for checking the directories and files in the given server!

The architechture has been implementing using Models Dirdetail and Filedetail along with their corresponding Serializers to display the useful JSON Data.

The following are the steps to use this API Toolbox:

1. bundle install
2. rails db:migrate
3. rail s 

Check localhost:3000 to verify if the server is working or not!

Now to push all the directory and file data into the database run the following HTTP request:

GET /init or simple do- http:/localhost:3000/init

This will update the entire database and you are ready to use it!

The following are the APIs and their corresponding responses:

1. http:/localhost:3000/dirdetails/ -> Display all Directories
2. http:/localhost:3000/filedetails/ -> Display all Files
3. http:/localhost:3000/dirdetails/?path=PATH -> Display all contents of the given path of a directory
4. http:/localhost:3000/filedetails/?path=PATH -> Display all contents of the given path of a file
