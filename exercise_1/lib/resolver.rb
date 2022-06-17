class Resolver
  def initialize(sum, int_array)
    @sum = sum
    @int_array = int_array
  end

  def execute
    results = []
    removed_index = []

    @int_array.sort.each_with_index do |element, index|
      next if removed_index.include?(index)

      left_num = @sum - element
      next if left_num.negative?

      left_num_index = @int_array.find_index(left_num)
      if left_num_index && left_num_index != index && element != @int_array[left_num_index]
        results.push([element, left_num].sort)
        removed_index.push(left_num_index)
      end
    end

    results.uniq
  end
end
