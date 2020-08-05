require './enumerable.rb'

describe 'Custom Enumerable Methods' do
  SIZE = 100
  let(:array) { Array.new(SIZE) { rand(0..SIZE) } }
  let(:range) { Range.new(0, 9) }
  let(:hash) { { a: 'A', b: 'B', c: 'C' } }
  let(:numbers) { [1, 2.332, 66, 90.7] }
  let(:words) { %w[cat dog lion dolphin] }
  let(:block) { proc { |el| el } }
  let(:block_num) { proc { |el| el < 5 } }
  let(:block_args) { proc { |el, index| el + index } }

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
        expect(range.select.inspect).to eql(range.select.inspect)
      end

      it 'when applied on an hash' do
        expect(hash.select.inspect).to eql(hash.select.inspect)
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
end
