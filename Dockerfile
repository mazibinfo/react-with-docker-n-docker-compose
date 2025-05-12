FROM node:18

# Install nginx and supervisor
RUN apt update && apt install -y nginx supervisor

# Create app directory
WORKDIR /app

# Copy application files
COPY . .

# Install app dependencies
RUN npm install

# Copy nginx and supervisor configs
COPY nginx.conf /etc/nginx/sites-available/default
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose ports
EXPOSE 80

# Start both processes
CMD ["/usr/bin/supervisord"]