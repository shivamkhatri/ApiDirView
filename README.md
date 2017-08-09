# README

This api allows you to access the base directory ./public/homedir .

Database was created using task file : sucide (lib/tasks/sucide.rake)

Through following commands :

* rake sucide:dbinit

* rake sucide:dbupdate

Database consist of a single table named : pathprints

With 1-many self join relation on itself.

Finally the json data was serialized using active modal serializer and rendered to the user.

To query Base Directory, try the following urls:

* http://localhost:3000/

* http://localhost:3000/?path=PATH

e.g: http://localhost:3000/?path=tempdir1
