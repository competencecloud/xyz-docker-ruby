FROM rails:onbuild

#This image includes multiple ONBUILD triggers which should cover most applications. 
# - The build will:
#		COPY . /usr/src/app, 
#		RUN bundle install 
#		EXPOSE 3000
#		Set the default command to rails server.