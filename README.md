# xyz-docker-ruby
Docker container for a Ruby server

**Build:**

    docker build -t my-rails-app .

**Run: **

    docker run -p 3000:3000 -d my-rails-app
    
    
You have to forward the port 3000 in VirtualBox Manager to 3000 ( or the port that you start the server on.)

If you do change the port the server listens on you also have to export it in the Dockerfile, for ex. EXPORT 80


