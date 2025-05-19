# Starting a practice project and this folder will contain my personal notes for following and or re-tracing back my steps. We are to recreate a simple webpage using Ruby on Rails. We installed Rails 8 even though we will use Rails 6 eventually, but the differences shuoldn't be so big since the guide we'll use was made for Rails 6. If we can change it later to match, we will.

# We start any new rails project (after everything is installed and set-up) by typing "rails new <project_name>" into the console. This will create a new folder with the name of our project and fill it with all the default folders and files. Of importance among these files is the GEMFILE which controls the versions of the dependencies in our project. BUNDLER can install our dependencies using this file with the "bundle" command. After that we can run "rails s" to start up our development environment server. On our empty project so far, it will only show the default splash page for Rails.

# Now, on chrome we can open the dev tools and open the Network tab to see the HTTP requests of any page. On the METHOD tab we can see wether the requests are POST, GET, etc. If we click on any of the elements in the list we can see more details:
# Request URL       https://www.google.com/     Browser understands HTTP(port 80 by default) and HTTPS (port 443 by default)
# Request Method    GET                         This is the METHOD the request used
# Status Code       200 OK                      This code shows the information exchange went well
# Remote Address    216.58.202.68:443           This is the remote IP adress where we get our page from. Notice the port 443 since we used SSL (HTTPS)
# Referrer Policy   origin

# METHODS BREAKDOWN:
# GET: asks the IP to send data to my browser, so it can load the page or a portion of it
# POST: sends data to the server, usually to login or something similar
# PUT/PATCH: edits some data already on the server, useful when updating your username or something like that
# DELETE: deletes data in the backend

# The rest of the headers sent by the server & browser can be read by scrolling but they contain cookies and data requests. Then the servers sends an HTML text file that contains the page. The rails log can show us this data from the server's POV. For more info we can research https://en.wikipedia.org/wiki/HTTP. It may be important to understand later since it controls all our requests going in and out our Rails app
