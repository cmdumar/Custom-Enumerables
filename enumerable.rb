# Our enumerable methods
# rubocop:disable Metrics/ModuleLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/PerceivedComplexity
module Enumerable
  def my_each
    ary = self
    ary = ary.is_a?(Array) ? ary : ary.to_a
    return enum_for unless block_given?

    i = 0
    while i < ary.length
      yield(ary[i])
      i += 1
    end
    ary
  end

  def my_each_with_index
    ary = self
    ary = ary.is_a?(Array) ? ary : ary.to_a
    return enum_for unless block_given?

    i = 0
    while i < ary.length
      yield(ary[i], i)
      i += 1
    end
    ary
  end

  def my_select
    ary = self
    ary = ary.is_a?(Array) ? ary : ary.to_a
    filtered_ary = []
    x = 0
    while x < ary.length
      filtered_ary << ary[x] if yield(ary[x]) == true
      x += 1
    end
    filtered_ary
  end

  def my_all?
    ary = self
    ary = ary.is_a?(Array) ? ary : ary.to_a
    value = true
    return true if ary.empty?

    i = 0
    while i < ary.length
      return false unless yield(ary[i])

      i += 1
    end

    value
  end

  def my_any?
    ary = self
    ary = ary.is_a?(Array) ? ary : ary.to_a

    value = false
    return true if ary.empty?

    i = 0
    while i < ary.length
      return true if yield(ary[i]) == true

      i += 1
    end
    value
  end

  def my_none?
    ary = self
    ary = ary.is_a?(Array) ? ary : ary.to_a

    value = true
    return true if ary.empty?

    i = 0
    while i < ary.length
      return false if yield(ary[i]) == true

      i += 1
    end
    value
  end

  def my_count(arg = nil)
    ary = self
    ary = ary.is_a?(Array) ? ary : ary.to_a

    return ary.length if arg.nil? && !block_given?

    counter = 0
    i = 0
    if block_given?
      while i < ary.length
        counter += 1 if yield(ary[i])
        i += 1
      end
    else
      while i < ary.length
        counter += 1 if ary[i] == arg
        i += 1
      end
    end
    counter
  end

  def my_map
    ary = self
    ary = ary.is_a?(Array) ? ary : ary.to_a
    return enum_for unless block_given?

    i = 0
    arr = []
    while i < ary.length
      arr.push(yield(ary[i]))
      i += 1
    end
    arr
  end

  def my_map_proc_block(proc_arg)
    ary = self
    ary = ary.is_a?(Array) ? ary : ary.to_a

    return enum_for unless block_given?

    arr = []
    if proc_arg.nil?
      i = 0
      while i < ary.length
        arr.push(yield(ary[i]))
        i += 1
      end
    else
      ary.my_each { |arr_item| arr.push(proc_arg(arr_item)) }
    end
    arr
  end

  def my_inject(arg = nil, sym = nil)
    ary = self
    ary = ary.is_a?(Array) ? ary : ary.to_a

    acc = ary[0]
    if arg.nil? && sym.nil?
      i = 1
      while i < ary.length
        acc = yield(acc, ary[i])
        i += 1
      end
    elsif !arg.nil? && sym.nil?
      if arg.is_a?(Integer)
        acc = arg
        i = 0
        while i < ary.length
          acc = yield(acc, ary[i])
          i += 1
        end
      elsif arg.is_a?(String) || arg.is_a?(Symbol)
        acc = ary[0]
        i = 1
        while i < ary.length
          acc = acc.send(arg, ary[i])
          i += 1
        end
      end
    elsif !arg.nil? && !sym.nil?
      acc = arg
      i = 0
      while i < ary.length
        acc = acc.send(sym, ary[i])
        i += 1
      end
    end
    acc
  end
end

def multiply_els(arr)
  arr.my_inject(:*)
end
# rubocop:enable Metrics/ModuleLength
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/PerceivedComplexity
