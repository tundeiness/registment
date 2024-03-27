# Use the official Ruby image as the base image
FROM ruby:3.1.0

# Set the working directory inside the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock to the working directory
COPY Gemfile Gemfile.lock ./

# Install dependencies using Bundler
RUN gem install bundler
RUN bundle install --jobs 4 --retry 3

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port on which the Rails API will run
EXPOSE 3001

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
