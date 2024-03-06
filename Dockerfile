# Step 1: Build the React application
FROM node:latest as build-stage

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock if you're using yarn)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the source code into the image
COPY . .

# Build the application
RUN npm run build

# Step 2: Serve the application
FROM nginx:stable-alpine as production-stage

# Copy the build artifacts from the build stage to the nginx folder
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Expose port 80 to the outside once the container has launched
EXPOSE 80

# Start nginx and serve the application
CMD ["nginx", "-g", "daemon off;"]
