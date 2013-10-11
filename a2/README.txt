README.md
Assignment #2: MessageHub
Connor Cunningham
^^^^^^^^^^^^^^^^^^^^^^^^^
All requirements for the project were met;
important notes are listed below.

-> The index action of the messages controller
   renders two separate files depending on the
   type of GET. 

   1) One render populates the page
   with all messages stored in the model
   (http GET requests with no parameters). 

   2) The other render populates the page with 
   messages submitted since the page was first 
   rendered (ajax GET request with last message
   id as parameter).

-> The last message rendered is tracked using a
   hidden dom element (<p>) and accessed and
   updated with jQuery.  This id is added as a
   parameter to ajax requests for updating the
   page.

-> Individual messages can be accessed through
   http://localhost:3000/messages/"message id".

-> Time ago format was obtained using native
   rails time_ago_in_words on each message's
   updated_at attribute.

FUTURE DEVELOPMENT OF APP
^^^^^^^^^^^^^^^^^^^^^^^^^
As we begin to investigate mobile apps that
access MessageHub, there are a few additions
I'd like to make to improve performance
and usability:

-> Error messages for failed database queries,
   including validation failures

-> Redirect/ error messages for routing errors

-> Minimization of database queries

-> Memcache implementation

-> Improved method for storing last rendered
   message











