Sequel::Model.plugin(:schema)
Sequel::Model.plugin :json_serializer
Sequel::Model.raise_on_save_failure = false # Do not throw exceptions on failure
Sequel::Model.db = case Padrino.env
  when :development then Sequel.connect("postgres://admin:postgres@localhost/merobaron_development", :loggers => [logger])
  when :production  then Sequel.connect(ENV['DATABASE_URL'],  :loggers => [logger])
  when :test        then Sequel.connect("postgres://admin:postgres@localhost/merobaron_test",  :loggers => [logger])
end
