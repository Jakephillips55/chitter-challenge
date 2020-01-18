require 'pg'

def test_data_clear
  p "Setting up test database..."

  connection = PG.connect(dbname: 'peeps_test')

  connection.exec("TRUNCATE peeps;")
end
