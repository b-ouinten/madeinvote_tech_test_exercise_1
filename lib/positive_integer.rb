class PositiveInteger
  attr_reader :value

  def initialize
    @value = 1
  end

  def value_updated?(value)
    return false if value <= 0
    @value = value
    true
  end
  
  def find_greatest_binary_gap
    greatest_binary_gap = 0
    binary_gap_chain = ''
    to_binary.each_char do |bit_char|
      if bit_char.eql? '0'
        binary_gap_chain << bit_char
      elsif not binary_gap_chain.empty?
        binary_gap_chain_size = binary_gap_chain.size
        greatest_binary_gap = binary_gap_chain_size if binary_gap_chain_size > greatest_binary_gap
        binary_gap_chain = ''
      end
    end
    
    greatest_binary_gap
  end
  
  def find_greatest_binary_gap_elegant_way
    to_binary_elegant_way.gsub(/0+(?=1)/).max_by {|x| x.size}.to_s.size
  end
  
  private
  
  
  def to_binary
    quotient = @value
    binary = ''
    until quotient == 0 do
      binary << (quotient % 2).to_s
      quotient /= 2
    end
    
    binary.reverse
  end
  
  def to_binary_elegant_way
    @value.to_s(2)
  end
end
