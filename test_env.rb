
def test_env

  if ENV['ENVIRONMENT'] == 'test'
    @connecto = PG.connect(dbname: 'peeps_test')
  else
    @connecto = PG.connect(dbname: 'peeps')
  end

end
