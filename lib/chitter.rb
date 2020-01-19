require 'pg'
require_relative '../test_env'

class ChitterControl

  attr_accessor :connecto

  def self.all
    @connecto = test_env
    output = @connecto.exec("SELECT * FROM peeps ORDER BY created_at DESC;")
    # output.map { |variables|
    #   variables['peep'],
    #   variables['created_at']
    # }
  end

  def self.create(peep:)
    @connecto = test_env
    @connecto.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
  end
end
