# Use a specific base image
FROM ubuntu:20.04

# Install nginx
RUN apt-get update && apt-get install -y nginx && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy HTML files to the nginx directory
COPY ./var/www/html/ /usr/share/nginx/html/

# Expose port 80 
EXPOSE 80

# Run as a non-root user
RUN useradd -r -s /bin/false nginxuser
USER nginxuser

# Start nginx
CMD ["nginx", "-g", "daemon off;"]