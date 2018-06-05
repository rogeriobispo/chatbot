configure :development do
  set :database, {
    adapter: 'postgresql',
    encoding: 'utf8',
    database: 'chatbot_development',
    pool: 5,
    username: 'postgres',
    host: '127.0.0.1'
  }
end

configure :test do
  set :database, {
    adapter: 'postgresql',
    encoding: 'utf8',
    database: 'chatbot_test',
    pool: 5,
    username: 'postgres',
    host: '127.0.0.1'
  }
end

configure :production do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///postgres/onebitbot_production')

  set :database, {
    adapter:  db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    username: db.user,
    password: db.password,
    database: db.path[1..-1],
    encoding: 'utf8'
  }
end
