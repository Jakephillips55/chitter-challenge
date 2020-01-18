require 'chitter'

describe '.display' do
  it 'shows all peeps' do
    chitter = Chitter.display

    expect(chitter).to include 'First Test Peep'

  end
end
