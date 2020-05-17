# frozen_string_literal: true

class Card
  attr_reader :color, :value

  def initialize(color, value)
    @color = color
    @value = value
  end
end
