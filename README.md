

# Sources

https://book.getfoundry.sh/

https://pentestwiki.org/blockchain/how-to-install-and-use-paradigm-foundry/

https://jamesbachini.com/foundry-tutorial/

https://blog.logrocket.com/unit-testing-smart-contracts-forge/

https://chainstack.com/using-chainlink-data-feeds-with-foundry/


commands:

# FORGE

forge build

make build  // cleans all and runs forge build again, useful when a template is forked
forge test

forge run <script_filename>
forge create ./src/Faucet.sol:Faucet -i --rpc-url 'https://rpc.ankr.com/polygon_mumbai' --private-key ${PRIVATE_KEY} --constructor-args 'token_address'  --verify 
 --etherscan-api-key  ${ETHERSCAN_API_KEY}

forge create --rpc-url https://mainnet.infura.io --private-key abc123456789 src/MyContract.sol:MyContract --constructor-args "Hello Foundry" "Arg2"

forge verify-contract --chain-id 1 --num-of-optimizations 200 --constructor-args (cast abi-encode "constructor(string)" "Hello Foundry" --compiler-version v0.8.10+commit.fc410830 0xContractAddressHere src/MyContract.sol:MyContract ABCetherscanApiKey123

forge flatten --output src/MyContract.flattened.sol src/MyContract.sol

forge inspect src/MyContract.sol abi

forge install foundry-rs/forge-std

forge install OpenZeppelin/openzeppelin-contracts

after installing a library add these to remappings in toml file by copying the path value from gitmoduled file and paste on right hand side of below eq'n.
@openzeppelin/ = lib/openzeppelin-contracts
ds-test/=lib/forge-std/lib/ds-test/src/
solmate/=lib/solmate/src/

# CAST

cast call 0xabc123 "totalSupply()(uint256)" --rpc-url https://eth-mainnet.alchemyapi.io

cast send 0xabc123 "mint(uint256)" 3 --rpc-url https://eth-mainnet.alchemyapi.io --private-key=abc123

cast tx 0xa1588a7c58a0ac632a9c7389b205f3999b7caee67ecb918d07b80f859aa605fd

cast estimate 0xabc123 "mint(uint256)" 3 --rpc-url https://eth-mainnet.alchemyapi.io --private-key=abc123

# CHEATCODES

Essential Cheat Codes – Full list here: https://github.com/foundry-rs/forge-std/blob/master/src/Vm.sol

vm.warp(uint256) external; Set block.timestamp

vm.roll(uint256) external; Set block.height

vm.prank(address) external; Sets the next calls msg.sender to be the input address

vm.startPrank(address) external; Sets all subsequent calls msg.sender to be the input address

vm.stopPrank() external; Resets subsequent calls msg.sender to be `address(this)`

vm.deal(address, uint256) external; Sets an addresses balance, (who, newBalance)

vm.expectRevert(bytes calldata) external; Expects an error on next call

vm.record() external; Record all storage reads and writes

vm.expectEmit(true, false, false, false); emit Transfer(address(this)); transfer(); Check event topic 1 is equal on both events

vm.load(address,bytes32) external returns (bytes32); Loads a storage slot from an address

vm.store(address,bytes32,bytes32) external; Stores a value to an addresses storage slot, (who, slot, value)






# Forge Template

Template for Forge project based on https://github.com/soliditylabs/forge-erc20-template.

## Getting Started

Click `Use this template` on [Github](https://github.com/PraneshASP/forge-template) to create a new repository with this repo as the initial state.

Or run (also works for existing projects):

```bash
forge init --template https://github.com/PraneshASP/forge-template
git submodule update --init --recursive
forge install
```

## Directory structure

```ml
lib
├─ forge-std — https://github.com/brockelmore/forge-std
├─ openzeppelin-contracts — https://github.com/OpenZeppelin/openzeppelin-contracts
src
├─ tests
│  └─ Faucet.t.sol — "Simple base setup for tests"
├─ Facuet.sol — "A Simple starter for the Faucet contract"
└─ MockERC20.sol — "A mock erc20 token for the faucet"

```

## Development

**Compilation**

```bash
forge build
```

**Testing**

```bash
forge test
```

To run tests with console outputs (`console.logs()`):

```bash
forge test -vv
```


**Deployment**

Copy the .`env.example` file to `.env` and update the values.

First, deploy the MockERC20 to Kovan:

```bash
./scripts/deploy_token_kovan.sh
```

Then, deploy the Faucet to Kovan:

```bash
./scripts/deploy_faucet_kovan.sh
```

### Configure Foundry

Using [foundry.toml](./foundry.toml), Foundry is easily configurable.

For a full list of configuration options, see the Foundry [configuration documentation](https://github.com/gakonst/foundry/blob/master/config/README.md#all-options).

## License

[MIT](https://github.com/PraneshASP/forge-template/blob/master/LICENSE)

## Acknowledgements

- https://github.com/soliditylabs/forge-erc20-template as main reference

## Disclaimer

_These smart contracts are being provided as is. No guarantee, representation or warranty is being made, express or implied, as to the safety or correctness of the user interface or the smart contracts. They have not been audited and as such there can be no assurance they will work as intended, and users may experience delays, failures, errors, omissions, loss of transmitted information or loss of funds. The creators are not liable for any of the foregoing. Users should proceed with caution and use at their own risk._
