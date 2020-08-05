require './enumerable.rb'

describe 'Custom Enumerable Methods' do
  SIZE = 100
  let(:array) { Array.new(SIZE) { rand(0..SIZE) } }
  let(:range) { Range.new(0, 9) }
  let(:hash) { { a: 'A', b: 'B', c: 'C' } }
  let(:numbers) { [1, 2.332, 66, 90.7] }
  let(:words) { %w[cat dog lion dolphin] }
  let(:block) { proc { |i| i < 10 } }

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
 
  end
end
