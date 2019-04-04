require 'minitest/autorun'
require 'ntzblockchain'

class NtzblockchainTest < Minitest::Test

    def test_genesis_block_is_block_instance

        genesis_block = Ntzblockchain::Block.genesis
        assert genesis_block.class, Ntzblockchain::Block

        # gensis block is hard coded. It shoud be this
        theblock = Ntzblockchain::Block.new('gen-last-hash', 'gen-hash', 'gen-data')
        assert genesis_block, theblock

    end

    def test_first_chain_must_be_genesis_block

        # gensis block is hard coded. It shoud be this
        genesis_block = Ntzblockchain::Block.new('gen-last-hash', 'gen-hash', 'gen-data')

        blockchain = Ntzblockchain::Blockchain.new
        assert blockchain.chain[0], genesis_block
    end

    def test_should_add_block_to_the_blockchain
        blockchain = Ntzblockchain::Blockchain.new # auto added genesis (#1)

        blockchain.add_block("aa") # 2
        blockchain.add_block("ab") # 3
        blockchain.add_block("ac") # 4
        puts blockchain.inspect

        assert blockchain.chain.size, 4
    end

end
