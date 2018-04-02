configure :development do
  set :database, {
    adapter: 'postgresql',
    encoding: 'utf8',
    database: 'chatbot_development',
    pool: 5,
    username: 'postgres',
    host: 'postgres'
  }
end

configure :test do
  set :database, {
    adapter: 'postgresql',
    encoding: 'utf8',
    database: 'chatbot_test',
    pool: 5,
    username: 'postgres',
    host: 'postgres'
  }
end

configure :production do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///postgres/onebitbot_production')

  set :database, {
    adapter: 'postgresql',
    encoding: 'utf8',
    database: 'chatbot_production',
    pool: 5,
    username: 'postgres',
    host: 'postgres'
  }
end
