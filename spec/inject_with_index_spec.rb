require 'inject_with_index'

describe Array do
	let(:sample_array){[1,2,3,4,5]}
	describe 'inject_with_index' do
		context 'no argument' do
			it 'makes the first element of the list the acc if no arg passed' do
				expect(sample_array.inject_with_index() {|acc, el, i| acc += el*i}).
				to eq 27
			end
		end
		context 'argument passed, accumulate an ary, hash etc' do
			it 'does arrays' do
				expect(sample_array.inject_with_index([]) {|acc, el, i| 
					acc << el * i 
				}).to eq [0, 2, 6, 12, 20]
			end
			it 'does hashes' do
				expect(sample_array.inject_with_index({}) {|acc, el, i| 
					acc[el.to_s] = i
					acc
				}).to eq({"1" => 0, "2" => 1, "3" => 2, "4" => 3, "5" => 4})
			end
		end
	end
end