require 'pg'
require_relative '../test_env'

class ChitterControl

  attr_accessor :connecto

  def self.all
  @connecto = test_env

    output = @connecto.exec("SELECT * FROM peeps;")
    output.map { |variable| variable['peep'] }
  end

  def self.create(peep:)
    test_env
      @connecto.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
  end
end
