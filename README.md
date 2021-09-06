Launching 'ganache-cli --port 8545 --gasLimit 12000000 --accounts 10 --hardfork istanbul --mnemonic brownie --fork http://192.168.142.130:8545'...

Brownie environment is ready.
>>>
>>> z = Swap.deploy({"from": accounts[0]}) # First deploy leaves some random ETH in contract account, strangely, so redo it.
Transaction sent: 0x247fd975d8b523620201644bd3009700e34313fbf453869ba457a38d6a6c5d03
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 1
  Swap.constructor confirmed - Block: 13172975   Gas used: 754295 (6.29%)
  Swap deployed at: 0x602C71e4DAC47a042Ee7f46E0aee17F94A3bA0B6

>>> z = Swap.deploy({"from": accounts[0]})
Transaction sent: 0xcf0c12110475d6255e4cb9ef3085919013a2ff1b5ceb1878ded0ec9bd35f9fd2
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 2
  Swap.constructor confirmed - Block: 13172976   Gas used: 754295 (6.29%)
  Swap deployed at: 0xE7eD6747FaC5360f88a2EFC03E00d25789F69291

>>> usdt = interface.IERC20("0xdAC17F958D2ee523a2206206994597C13D831ec7")
>>> usdt.balanceOf(accounts[0]), usdt.balanceOf(z), web3.eth.getBalance( str(z) ), web3.eth.getBalance( str(accounts[0]) )
(0, 0, 0, 100000000000000000000)
>>> z.uSwap({'from': accounts[0], 'value': 1e18})
Transaction sent: 0xb979d26d8350d4b785fe835a68620f6b11e7264d51611cd8e14256684e1b7d6a
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 3
  Swap.uSwap confirmed - Block: 13172977   Gas used: 124278 (1.04%)

<Transaction '0xb979d26d8350d4b785fe835a68620f6b11e7264d51611cd8e14256684e1b7d6a'>
>>> usdt.balanceOf(accounts[0]), usdt.balanceOf(z), web3.eth.getBalance( str(z) ), web3.eth.getBalance( str(accounts[0]) )
(0, 3919680393, 0, 99000000000000000000)
>>> z.sArb({'from': accounts[0]})
Transaction sent: 0x5d1e2931aff56b34f6f12f6bb7530206bb8736f27331f8c5f089486e99dcf395
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 4
  Swap.sArb confirmed - Block: 13172978   Gas used: 109420 (0.91%)

<Transaction '0x5d1e2931aff56b34f6f12f6bb7530206bb8736f27331f8c5f089486e99dcf395'>
>>> usdt.balanceOf(accounts[0]), usdt.balanceOf(z), web3.eth.getBalance( str(z) ), web3.eth.getBalance( str(accounts[0]) )
(0, 0, 0, 99991031507319623591)
>>>


