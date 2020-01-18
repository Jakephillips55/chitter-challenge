require 'pg'

class Chitter

  def self.display
    connecto = PG.connect(dbname: 'peeps')
    output = connecto.exec("SELECT * FROM peeps;")
    output.map { |variable| variable['peep'] }
  end
end
