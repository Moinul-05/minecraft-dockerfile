My Minecraft Server with Ubuntu
LABEL maintainer="Moinul05" 
      name="my_minecraft_server with docker" 
      version="1.0"


# setting Environment Variables
# Installing Required Packages
# Clean security rather than root, setting up dedicated user for the server
# Entry point script with start.sh
# data directory for the server
# adding dedicated user minecraft for the data directory
# Run authority for the user
# Dedicated volume for the server 
# Exposing minecraft port
