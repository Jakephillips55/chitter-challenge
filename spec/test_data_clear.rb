require 'pg'

def test_data_clear
  p "Setting up test database..."

  connecto = PG.connect(dbname: 'peeps_test')

  connecto.exec("TRUNCATE peeps;")
end
