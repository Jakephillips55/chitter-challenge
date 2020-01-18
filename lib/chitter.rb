require 'pg'

class ChitterControl

  def self.all
    if ENV['ENVIROMENT'] == 'test'
      connecto = PG.connect(dbname: 'peeps_test')
    else
      connecto = PG.connect(dbname: 'peeps')
    end

    output = connecto.exec("SELECT * FROM peeps;")
    output.map { |variable| variable['peep'] }
  end

  def self.create(peep:)
    if ENV['ENVIROMENT'] == 'test'
      connecto = PG.connect(dbname: 'peeps_test')
    else
      connecto = PG.connect(dbname: 'peeps')
    end
    connecto.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
  end
end
