require './enumerable.rb'

describe 'Custom Enumerable Methods' do
  SIZE = 100
  let(:array) { Array.new(SIZE) { rand(0..SIZE) } }
  let(:range) { Range.new(0, 9) }
  let(:hash) { { a: 'A', b: 'B', c: 'C' } }
  let(:numbers) { [1, 2.332, 66, 90.7] }
  let(:words) { %w[cato dog lion dolphin] }
  let(:block) { proc { |el| el } }
  let(:block_num) { proc { |el| el < 5 } }
  let(:block_args) { proc { |el, index| el + index } }
  # let(:block_acc) { proc { |sum, el| sum + el } }

  describe '#my_each' do
    context 'No Block Given:' do
      it 'when applied on an array' do
        expect(array.my_each.inspect).to eql(array.each.inspect)
      end

      it 'when applied on a range' do
        expect(range.my_each.inspect).to eql(range.each.inspect)
      end

      it 'when applied on an hash' do
        expect(hash.my_each.inspect).to eql(hash.each.inspect)
      end
    end
 
    context 'Block Given:' do
      it 'when applied on an array' do
        expect(array.my_each(&block_num)).to eql(array.each(&block_num))
      end

      it 'when applied on a range' do
        expect(range.my_each(&block_num)).to eql(range.each(&block_num))
      end

      it 'when applied on an hash' do
        expect(hash.my_each(&block)).to eql(hash.each(&block))
      end

      it 'when applied on a numbers array' do
        expect(numbers.my_each(&block_num)).to eql(numbers.each(&block_num))
      end

      it 'when applied on a words array' do
        expect(words.my_each(&block)).to eql(words.each(&block))
      end
    end
  end

  describe '#my_each_with_index' do
    context 'No Block Given:' do
      it 'when applied on an array' do
        expect(array.my_each_with_index.inspect).to eql(array.each_with_index.inspect)
      end

      it 'when applied on a range' do
        expect(range.my_each_with_index.inspect).to eql(range.each_with_index.inspect)
      end

      it 'when applied on an hash' do
        expect(hash.my_each_with_index.inspect).to eql(hash.each_with_index.inspect)
      end
    end
 
    context 'Block Given:' do
      it 'when applied on an array' do
        expect(array.my_each_with_index(&block_args)).to eql(array.each_with_index(&block_args))
      end

      it 'when applied on a range' do
        expect(range.my_each_with_index(&block_args)).to eql(range.each_with_index(&block_args))
      end

      it 'when applied on an hash' do
        expect(hash.my_each_with_index(&block)).to eql(hash.each_with_index(&block))
      end

      it 'when applied on a numbers array' do
        expect(numbers.my_each_with_index(&block_args)).to eql(numbers.each_with_index(&block_args))
      end
    end
  end

  describe '#my_select' do
    context 'No Block Given:' do
      it 'when applied on an array' do
        expect(array.my_select.inspect).to eql(array.select.inspect)
      end

      it 'when applied on a range' do
        expect(range.my_select.inspect).to eql(range.select.inspect)
      end

      it 'when applied on an hash' do
        expect(hash.my_select.inspect).to eql(hash.select.inspect)
      end
    end

    context 'Block Given:' do
      it 'when applied on an array' do
        expect(array.my_select(&block_num)).to eql(array.select(&block_num))
      end

      it 'when applied on a range' do
        expect(range.my_select(&block_num)).to eql(range.select(&block_num))
      end

      it 'when applied on an hash' do
        expect(hash.my_select(&block)).to eql(hash.select(&block))
      end

      it 'when applied on a numbers array' do
        expect(numbers.my_select(&block_num)).to eql(numbers.select(&block_num))
      end
    end
  end

  describe '#my_all?' do
    context 'No Block Given:' do
      it 'when applied on an array' do
        expect(array.my_all?).to eql(array.all?)
      end

      it 'when applied on a range' do
        expect(range.my_all?).to eql(range.all?)
      end

      it 'when applied on an hash' do
        expect(hash.my_all?).to eql(hash.all?)
      end

      it 'when no argument is passed' do
        expect(array.my_all?).to eql(array.all?)
      end
    end

    context 'Block Given:' do
      it 'when applied on an array' do
        expect(array.my_all?(&block_num)).to eql(array.all?(&block_num))
      end

      it 'when applied on a range' do
        expect(range.my_all?(&block_num)).to eql(range.all?(&block_num))
      end

      it 'when applied on an hash' do
        expect(hash.my_all?(&block)).to eql(hash.all?(&block))
      end
    end

    context 'Argument Given:' do
      it 'when a class is passed' do
        expect(array.my_all?(Numeric)).to eql(array.all?(Numeric))
      end

      it 'when a Regex is passed' do
        expect(words.my_all?(/o/)).to eql(words.all?(/o/))
      end

      it 'when a pattern is passed' do
        expect(array.my_all?(1)).to eql(array.all?(1))
      end
    end
  end

  describe '#my_any?' do
    context 'No Block Given:' do
      it 'when applied on an array' do
        expect(array.my_any?).to eql(array.any?)
      end

      it 'when applied on a range' do
        expect(range.my_any?).to eql(range.any?)
      end

      it 'when applied on an hash' do
        expect(hash.my_any?).to eql(hash.any?)
      end

      it 'when no argument is passed' do
        expect(array.my_any?).to eql(array.any?)
      end
    end

    context 'Block Given:' do
      it 'when applied on an array' do
        expect(array.my_any?(&block_num)).to eql(array.any?(&block_num))
      end

      it 'when applied on a range' do
        expect(range.my_any?(&block_num)).to eql(range.any?(&block_num))
      end

      it 'when applied on an hash' do
        expect(hash.my_any?(&block)).to eql(hash.any?(&block))
      end
    end

    context 'Argument Given:' do
      it 'when a class is passed' do
        expect(array.my_any?(Numeric)).to eql(array.any?(Numeric))
      end

      it 'when a Regex is passed' do
        expect(words.my_any?(/o/)).to eql(words.any?(/o/))
      end

      it 'when a pattern is passed' do
        expect(array.my_any?(1)).to eql(array.any?(1))
      end
    end
  end

  describe '#my_none?' do
    context 'No Block Given:' do
      it 'when applied on an array' do
        expect(array.my_none?).to eql(array.none?)
      end

      it 'when applied on a range' do
        expect(range.my_none?).to eql(range.none?)
      end

      it 'when applied on an hash' do
        expect(hash.my_none?).to eql(hash.none?)
      end

      it 'when no argument is passed' do
        expect(array.my_none?).to eql(array.none?)
      end
    end

    context 'Block Given:' do
      it 'when applied on an array' do
        expect(array.my_none?(&block_num)).to eql(array.none?(&block_num))
      end

      it 'when applied on a range' do
        expect(range.my_none?(&block_num)).to eql(range.none?(&block_num))
      end

      it 'when applied on an hash' do
        expect(hash.my_none?(&block)).to eql(hash.none?(&block))
      end
    end

    context 'Argument Given:' do
      it 'when a class is passed' do
        expect(array.my_none?(Numeric)).to eql(array.none?(Numeric))
      end

      it 'when a Regex is passed' do
        expect(words.my_none?(/o/)).to eql(words.none?(/o/))
      end

      it 'when a pattern is passed' do
        expect(array.my_none?(1)).to eql(array.none?(1))
      end
    end
  end

  describe '#my_count' do
    context 'No Block Given:' do
      it 'when applied on an array' do
        expect(array.my_count).to eql(array.count)
      end

      it 'when applied on a range' do
        expect(range.my_count).to eql(range.count)
      end

      it 'when applied on an hash' do
        expect(hash.my_count).to eql(hash.count)
      end
    end

    context 'Block Given:' do
      it 'when applied on an array' do
        expect(array.my_count(&block_num)).to eql(array.count(&block_num))
      end

      it 'when applied on a range' do
        expect(range.my_count(&block_num)).to eql(range.count(&block_num))
      end

      it 'when applied on an hash' do
        expect(hash.my_count(&block)).to eql(hash.count(&block))
      end
    end
  end

  describe '#my_map' do
    context 'No Block Given:' do
      it 'when applied on an array' do
        expect(array.my_map.inspect).to eql(array.map.inspect)
      end

      it 'when applied on a range' do
        expect(range.my_map.inspect).to eql(range.map.inspect)
      end

      it 'when applied on an hash' do
        expect(hash.my_map.inspect).to eql(hash.map.inspect)
      end
    end

    context 'Block Given:' do
      it 'when applied on an array' do
        expect(array.my_map(&block_num)).to eql(array.map(&block_num))
      end

      it 'when applied on a range' do
        expect(range.my_map(&block_num)).to eql(range.map(&block_num))
      end

      it 'when applied on an hash' do
        expect(hash.my_map(&block)).to eql(hash.map(&block))
      end
    end
  end

  describe '#my_inject' do
    context 'No Block & Argument Given:' do
      it 'when a symbol is passed' do
        expect(array.my_inject(:+)).to eql(array.inject(:+))
      end

      it 'when a number and symbol is passed' do
        expect(range.my_inject(2, :*)).to eql(range.inject(2, :*))
      end
    end

    context 'Block & Argument Given:' do
      it 'when a number and block is passed' do
        expect(array.my_inject(2))
      end
    end

    # context 'Block Given:' do
    #   it 'when applied on an array' do
    #     expect(array.my_inject(&block_num)).to eql(array.inject(&block_num))
    #   end

    #   it 'when applied on a range' do
    #     expect(range.my_inject(&block_num)).to eql(range.inject(&block_num))
    #   end

    #   it 'when applied on an hash' do
    #     expect(hash.my_inject(&block)).to eql(hash.inject(&block))
    #   end
    # end
  end
end
