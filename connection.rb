# **** Database Connection ****
ActiveRecord::Base.establish_connection(
  :adapter  => "postgresql",
  :database => "wdiback"
)
