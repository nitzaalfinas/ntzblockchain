# ntzblockchain
Blockchain

# quick setup
rvm reload && gem cleanup ntzblockchain && rvm reload && rvm use ruby-2.5.1 && gem build ntzblockchain.gemspec && gem install ./ntzblockchain-0.0.0.gem && irb

# irb test
require 'ntzblockchain'
a = Ntzblockchain::Blockchain.new
a.add_block("aa")
