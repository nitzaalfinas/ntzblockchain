require 'digest'

def calc_hash(timestamp, last_hash, data)
    sha = Digest::SHA256.new
    sha.update( timestamp.to_s + last_hash + data.to_s )
    sha.hexdigest
end

module Ntzblockchain

    class Block

        attr_accessor :timestamp
        attr_accessor :last_hash
        attr_accessor :hash
        attr_accessor :data

        def initialize(last_hash, hash, data, timestamp: nil)
            # @index = index

            ## Blockchain is global. So, we need to use timestamp in UTC
            @timestamp = timestamp ? timestamp : Time.now.utc

            @last_hash = last_hash
            @hash = hash
            @data = data

        end

        def self.genesis
            Block.new('gen-last-hash', 'gen-hash', 'gen-data')
        end

        def self.mine_block(last_block, data)
            timestamp = Time.now.utc
            last_hash = last_block.hash
            hash = calc_hash(timestamp, last_hash, data)

            Block.new(last_hash, hash, data )
        end

    end

    class Blockchain

        attr_accessor :chain

        def initialize
            @chain = [Ntzblockchain::Block.genesis]
        end

        def add_block(data)
            #p self.chain
            new_block = Ntzblockchain::Block.mine_block(self.chain[self.chain.size-1], data )

            @chain.push(new_block)
        end

        def is_valid_chain(chain)
            if self.chain[0] != Ntzblockchain::Block.genesis then
                return false
            end
        end
    end
end
