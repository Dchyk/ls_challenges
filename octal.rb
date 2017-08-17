class Octal
  def initialize(num)
    @num = num
  end

  def to_decimal
    @num = '0' if @num.chars.any? { |num| num == '8' || num == '9' } || @num.to_i == 0

    decimal = 0

    @num.chars.map(&:to_i).reverse_each.with_index do |num, index|
      decimal += num * 8**index
    end

    decimal
  end
end