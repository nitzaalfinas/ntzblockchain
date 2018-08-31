require 'digest'

class Ntzblockchain


    class Block


        attr_reader :index
        attr_reader :timestamp
        attr_reader :transactions_count   # use alias - txn_count - why? why not?
        attr_reader :transactions         # use alias - txn       - why? why not?
        attr_reader :previous_hash
        attr_reader :hash

        def initialize(index, transactions, previous_hash, timestamp: nil)
            @index = index

            ## Blockchain is global. So, timestamp is UTC
            @timestamp = timestamp ? timestamp : Time.now.utc

            ## note: assumes / expects an array for transactions
            @transactions       = transactions
            @transactions_count = transactions.size

            @previous_hash = previous_hash
            @hash = calc_hash

        end

        def calc_hash
            sha = Digest::SHA256.new
            sha.update( @timestamp.to_s + @transactions.to_s + @previous_hash )
            sha.hexdigest
          end


        def self.first(*args)
            if args.size == 1 && args[0].is_a?(Array)
                transactions = args[0] # just one
            else
                transactions = args    # as an array
            end

            Block.new(0, transactions, '0')
        end

        def self.next(previous, *args)
            if args.size == 1 && args[0].is_a?(Array)
                transactions = args[0] # just one
            else
                transactions = args    # as an array
            end

            Block.new( previous.index+1, transactions, previous.hash )
        end

    end
end
