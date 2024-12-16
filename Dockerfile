# Use the official Nginx image
FROM nginx:alpine

# Set environment variable for custom port
ENV PORT=8080

# Copy the HTML file to the default Nginx directory
COPY index.html /usr/share/nginx/html/index.html

# Copy the custom Nginx configuration
COPY nginx.conf /etc/nginx/input.conf

# Expose the custom port
EXPOSE ${PORT}

# Command to run Nginx
CMD ["sh", "-c", "envsubst '${PORT}' < /etc/nginx/input.conf > /etc/nginx/default.conf && nginx -g 'daemon off;' -c '/etc/nginx/default.conf'"]
