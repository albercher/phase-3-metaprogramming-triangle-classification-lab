class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    triangle_validator
    if a == b && b == c
      :equilateral
    elsif a != b && b != c && a != c
      :scalene
    else
      :isosceles
    end

  end

  def sides_greater_than_zero?
    [a, b, c].all?(&:positive?)
  end

  def sum_of_two?
    a + b > c && a + c > b && b + c > a
  end

  def triangle_validator
    raise TriangleError unless sides_greater_than_zero? && sum_of_two?
  end

  class TriangleError < StandardError

  end

end
