FROM nginx:latest

# Copy your HTML application to NGINX default directory
COPY ./html /usr/share/nginx/html

# Expose port 80
EXPOSE 80

