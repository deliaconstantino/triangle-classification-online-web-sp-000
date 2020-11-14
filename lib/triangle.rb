class Triangle
  def initialize(side_a, side_b, side_c)
    @all_sides = [side_a, side_b, side_c]
  end

  def kind
    raise TriangleError if is_any_side_invalid?
    # raise TriangleError if @all_sides.any? { |num| num >= @all_sides.sum - num }
    return :equilateral if is_equilateral?
    return :scalene if @all_sides[0] != @all_sides[1] && @all_sides[1] != @all_sides[2] && @all_sides[0] != @all_sides[2]

    return :isosceles
  end

  def is_any_side_invalid?
    @all_sides.any? { |num| num <= 0 } ||
      @all_sides.any? { |num| num >= @all_sides.sum - num }
  end

  def is_equilateral?
    @all_sides[0] == @all_sides[1] && @all_sides[1] == @all_sides[2]
  end


  class TriangleError < StandardError
  end
end
