# frozen_string_literal: true

# Interface for states
class StateInterface
  def state_name
    raise 'Virtual function call'
  end

  def next_state_name
    raise 'Virtual function call'
  end

  def update
    raise 'Virtual function call'
  end

  def on_state_enter
    raise 'Virtual function call'
  end

  def on_state_leave
    raise 'Virtual function call'
  end
end
