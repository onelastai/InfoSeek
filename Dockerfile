FROM ruby:3.1

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set working directory
WORKDIR /app

# Copy Gemfile and install gems
COPY Gemfile* ./
RUN bundle install

# Copy the rest of the app
COPY . .

# Expose port and start the server
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
