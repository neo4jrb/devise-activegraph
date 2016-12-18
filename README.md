# Devise-Neo4j [![Build Status](https://secure.travis-ci.org/neo4jrb/devise-neo4j.png?branch=master)](http://travis-ci.org/neo4jrb/devise-neo4j)

A gem for Neo4j integration with the Devise authentication framework.

Neo4j: https://github.com/neo4jrb/neo4j Devise:
https://github.com/plataformatec/devise

## Usage

### Installation

Add the neo4j and devise-neo4j gems to your Gemfile:

    gem "neo4j"
    gem "devise-neo4j"

Run the bundle install command:

    bundle install

Then run the Devise install generator and optionally update or create a
devise-neo4j model:

    rails g devise:install --orm=neo4j
    # Make sure the model file is created ahead of time!
    rails g neo4j:devise MODEL  # (Where MODEL is something like User)
    
Add the Devise route to your config/routes.rb:

    devise_for :users

Now the model is set up like a default Devise model, meaning you can do things
like adding a `before_action` in a controller to restrict access to logged-in
users only:

    before_action :authenticate_<your model name>!

## Example App

You can see a very simple app that demonstrates Neo4j and devise here:

    gem install rails
    rails new myapp -m http://neo4jrb.io/neo4j/rails.rb -O
    cd myapp
    
    # Add the gem to your Gemfile, then run bundle:
    gem 'devise-neo4j'
    bundle
    
    rails generate devise:install --orm=neo4j

    # Install the database unless you already have a Neo4j database, or use JRuby Embedded Neo4j db
    rake neo4j:install[community-2.2.2] # check which one is the latest
    rake neo4j:start

    rails g neo4j:devise User
    
    # Add to your config/routes.rb:
    devise_for :users
    root :to => "secrets#show"

    # Generate a controller for the protected content
    rails g controller secrets show

    # In app/controllers/secrets_controller.rb add:
    before_action :authenticate_user!

    # In app/views/secrets/show.html.erb add:
    <p>Shhhh... this page is only visible to logged-in users!</p>
    <%= link_to "Log out", destroy_user_session_path, method: :delete  %>

    # Start the application and visit http://localhost:3000/users/sign_up
    rails s

## Developing

### For JRuby

JRUby neo4j has an embedded server as part of the gem, so nothing else is
needed to get set up and running.

### For Ruby

There is a Vagrant setup that installs neo4j so that you can easily get
started:

    $ vagrant up

The neo4j web interface is forward to port 7474 on your local machine:
[http://localhost:7474](http://localhost:7474).

## Note on testing

To run all test, simply type `rake` If you want to run a specific Devise test
(see the devise github repository) set the DEVISE_TEST_PATH.

Example: ``` rake DEVISE_TEST_PATH=integration/confirmable_test.rb ```

## Note on Patches/Pull Requests

*   Fork the project.
*   Make your feature addition or bug fix.
*   Add tests for it. This is important so I don't break it in a future
    version unintentionally.
*   Commit, do not mess with rakefile, version, or history. (if you want to
    have your own version, that is fine but bump version in a commit by itself
    I can ignore when I pull)
*   Send me a pull request. Bonus points for topic branches.


## Copyright

Copyright (c) 2011 Ben Jackson. See LICENSE for details.
