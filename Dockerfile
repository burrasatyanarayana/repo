# Use a lightweight web server image
FROM nginx:latest

# Copy application files to the container
COPY index.html /usr/share/nginx/html/
COPY styles.css /usr/share/nginx/html/
COPY scripts.js /usr/share/nginx/html/

# Expose port 8000
EXPOSE 8000

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
