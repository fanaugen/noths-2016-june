class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    container_number      = container_number_for(number)
    next_container_number = container_number_for(container_number.successor)
    "#{container_number} of beer on the wall, ".capitalize +
    "#{container_number} of beer.\n" +
    "#{container_number.action}, " +
    "#{next_container_number} of beer on the wall.\n"
  end

  def container_number_for(number)
    if number == 0
      ContainerNumber0
    elsif number == 1
      ContainerNumber1
    elsif number == 6
      ContainerNumber6
    else
      ContainerNumber
    end.new(number)
  end
end

class ContainerNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_s
    "#{amount} #{container}"
  end

  def amount
    number.to_s
  end

  def container
    "bottles"
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def pronoun
    "one"
  end

  def successor
    number - 1
  end
end

class ContainerNumber0 < ContainerNumber

  def amount
    "no more"
  end

  def action
    "Go to the store and buy some more"
  end

  def successor
    99
  end

end

class ContainerNumber1 < ContainerNumber

  def container
    "bottle"
  end

  def pronoun
    "it"
  end

end

class ContainerNumber6 < ContainerNumber
  def container
    "six-pack"
  end

  def amount
    "1"
  end
end
