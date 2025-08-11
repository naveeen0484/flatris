# Use Node.js as Flatris is a JavaScript/React game
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy all project files
COPY . .

# Build the app for production
RUN npm run build

# Install serve to serve the production build
RUN npm install -g serve

# Start the app
CMD ["serve", "-s", "build", "-l", "8080"]

EXPOSE 8080
