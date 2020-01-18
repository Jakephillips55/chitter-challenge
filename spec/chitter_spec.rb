require 'chitter'
require 'pg'

describe '.all' do
  it 'shows all peeps' do
    connection = PG.connect(dbname: 'peeps_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'First Test Peep');")
    connection.exec("INSERT INTO peeps VALUES(2, 'other test peep');")

    chitter = ChitterControl.all

    expect(chitter).to include 'First Test Peep'
    expect(chitter).to include 'other test peep'
  end
end

  describe '.create' do
    it "posts an update" do
      ChitterControl.create(peep: 'First Test Peep')
      ChitterControl.create(peep: 'other test peep')

      expect(ChitterControl.all).to include 'First Test Peep'
      expect(ChitterControl.all).to include 'other test peep'


    end
  end
