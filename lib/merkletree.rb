# class MerkleTree
#
#     attr_reader :root
#     attr_reader :leaves
#
#     class Node
#         attr_reader :value
#         attr_reader :left
#         attr_reader :right
#
#         def initialize(value, left, right)
#             @value = value
#             @left = left
#             @right = right
#         end
#
#         def dump()
#             do_dump( 0 )
#         end
#
#         def do_dump(depth)
#         end
#     end
#
#     def initialize(*args)
#         if args.size == 1 && arts[0].is_a? (Array)
#             hashes = args[0]
#         else
#             hashes = args
#         end
#
#         @hashes = hashes
#         @root = build_tree
#     end
#
#     def build_tree
#         level = @leaves = @hashes.map { |hash| Node.new(hash, nil, nil) }
#
#         if @hashes.size == 1
#             level[0]
#         else
#             while level.size > 1
#
#                 # loop
#                 level = level.each_slice(2).map do |left, right|
#                     right = left if right.nil?
#
#                     Node.new(MerkleTree.calc_hash(left.value + right.value), left, right)
#                 end
#             end
#
#             level[0]
#         end
#     end
# end
