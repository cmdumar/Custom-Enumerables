require './enumerable.rb'

describe 'Custom Enumerable Methods' do
  SIZE = 100
  let(:array) { Array.new(SIZE) { rand(0..SIZE) } }
  let(:range) { Range.new(0, 9) }
  let(:hash) { { a: 'A', b: 'B', c: 'C' } }
  let(:numbers) { [1, 2.332, 66, 90.7] }
  let(:words) { %w[cat dog lion dolphin] }
  let(:block) { proc { |i| i } }
  let(:block_num) { proc { |i| i < 5 } }

  describe '#my_each' do
    context 'No Block Given: ' do
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
 
    context 'Block Given: ' do
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
end
