# The Dockerfile just add the Rails on Ruby Gem into Ruby image

# Setting the basis image for Rails on Ruby project
# There must set a basis image in first row of Dockerfile
FROM ruby:2.5.0

# Setting the maintainer information
MAINTAINER Core <hfreedomx@gmail.com>

# RUN is executing command base on the current image and create a new image base on the executing result
# [-qq] in apt-get means not output the log except error log
# [-y] in apt-get means selecting yes as default when user is enquired in the process of executing command
# [build-essential] is package which relates compile function in Linux, it is necessary for development in Linux OS
# [libpq] is package which is the C application programmer's interface to PostgreSQL
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN apt-get install -y vim

# in order to fix the error about Rails on Ruby
# There was an error while trying to load the gem 'uglifier'
RUN apt-get install -y nodejs

# Setting a variable, the variable can be loaded by the RUN command below the ENV command
ENV RAILS_ROOT /StudyRailsOnRuby

# You should add a $ mark in front of variable to load it
RUN mkdir $RAILS_ROOT

# Setting work place folder for RUN/CMD/ENTRYPOINT
WORKDIR $RAILS_ROOT

# Copying the file to the target path
COPY Gemfile $RAILS_ROOT/Gemfile
COPY Gemfile.lock $RAILS_ROOT/Gemfile.lock

# Install the Gem by bundle, the Gemfile contains the Gems list about gems need to be install
RUN bundle install

# Copying all files of current folder to another folder
#COPY . $RAILS_ROOT

# set EXPOSE will infroms Docker that the container listens on the specified network ports at runtime
EXPOSE 3000

# The mian purpose of a [CMD] is to provide defaults for an executing container
# There can only be one [CMD] instruction in a Dockerfile. If yout list more than on [CMD] then only the last [CMD 
# will take effect
# The [CMD] command will be run when container is started to run
# [bundle exec rails s] command is start the built-in server in rails
#CMD bundle exec rails s
