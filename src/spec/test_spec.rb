# frozen_string_literal: true

require_relative '../Logic/action'
require_relative '../Logic/valera'

describe Action do
  valera = Valera.new
  action = Action.new('-10', '0', '0', '0', '0')

  valera.update_stats(action.create_new_stats(valera.stats))

  it 'check health' do
    expect(valera.stats.health).to equal 90
  end
end
