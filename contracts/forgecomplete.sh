#compdef forge

autoload -U is-at-least

_forge() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
":: :_forge_commands" \
"*::: :->forge" \
&& ret=0
    case $state in
    (forge)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:forge-command-$line[1]:"
        case $line[1] in
            (test)
_arguments "${_arguments_options[@]}" \
'--gas-limit=[the block gas limit]:GAS_LIMIT: ' \
'--chain-id=[the chainid opcode value]:CHAIN_ID: ' \
'--gas-price=[the tx.gasprice value during EVM execution]:GAS_PRICE: ' \
'--block-base-fee-per-gas=[the base fee in a block]:BLOCK_BASE_FEE_PER_GAS: ' \
'--tx-origin=[the tx.origin value during EVM execution]:TX_ORIGIN: ' \
'--block-coinbase=[the block.coinbase value during EVM execution]:BLOCK_COINBASE: ' \
'--block-timestamp=[the block.timestamp value during EVM execution]:BLOCK_TIMESTAMP: ' \
'--block-number=[the block.number value during EVM execution]:BLOCK_NUMBER: ' \
'--block-difficulty=[the block.difficulty value during EVM execution]:BLOCK_DIFFICULTY: ' \
'--block-gas-limit=[the block.gaslimit value during EVM execution]:BLOCK_GAS_LIMIT: ' \
'-e+[the EVM type you want to use (e.g. sputnik, evmodin)]:EVM_TYPE: ' \
'--evm-type=[the EVM type you want to use (e.g. sputnik, evmodin)]:EVM_TYPE: ' \
'-f+[fetch state over a remote instead of starting from empty state]:FORK_URL: ' \
'--fork-url=[fetch state over a remote instead of starting from empty state]:FORK_URL: ' \
'--fork-block-number=[pins the block number for the state fork]:FORK_BLOCK_NUMBER: ' \
'--initial-balance=[the initial balance of each deployed test contract]:INITIAL_BALANCE: ' \
'--sender=[the address which will be executing all tests]:SENDER: ' \
'-m+[only run test methods matching regex (deprecated, see --match-test, --match-contract)]:PATTERN: ' \
'--match=[only run test methods matching regex (deprecated, see --match-test, --match-contract)]:PATTERN: ' \
'(-m --match)--match-test=[only run test methods matching regex]:TEST_PATTERN: ' \
'(-m --match)--no-match-test=[only run test methods not matching regex]:TEST_PATTERN_INVERSE: ' \
'(-m --match)--match-contract=[only run test methods in contracts matching regex]:CONTRACT_PATTERN: ' \
'(-m --match)--no-match-contract=[only run test methods in contracts not matching regex]:CONTRACT_PATTERN_INVERSE: ' \
'--root=[the project'\''s root path. By default, this is the root directory of the current Git repository or the current working directory if it is not part of a Git repository]:ROOT:_files -/' \
'-c+[the directory relative to the root under which the smart contracts are]:CONTRACTS:_files -/' \
'--contracts=[the directory relative to the root under which the smart contracts are]:CONTRACTS:_files -/' \
'*-r+[the remappings]:REMAPPINGS: ' \
'*--remappings=[the remappings]:REMAPPINGS: ' \
'--remappings-env=[the env var that holds remappings]:REMAPPINGS_ENV: ' \
'*--lib-paths=[the paths where your libraries are installed]:LIB_PATHS:_files -/' \
'-o+[path to where the contract artifacts are stored]:OUT_PATH:_files -/' \
'--out=[path to where the contract artifacts are stored]:OUT_PATH:_files -/' \
'--evm-version=[choose the evm version]:EVM_VERSION: ' \
'--optimize-runs=[optimizer parameter runs]:OPTIMIZE_RUNS: ' \
'*--ignored-error-codes=[ignore warnings with specific error codes]:IGNORED_ERROR_CODES: ' \
'*--libraries=[add linked libraries]:LIBRARIES: ' \
'-j[print the test results in json format]' \
'--json[print the test results in json format]' \
'--ffi[enables the FFI cheatcode]' \
'*-v[Verbosity mode of EVM output as number of occurences of the `v` flag (-v, -vv, -vvv, etc.)
    3: print test trace for failing tests
    4: always print test trace, print setup for failing tests
    5: always print test trace and setup
]' \
'*--verbosity[Verbosity mode of EVM output as number of occurences of the `v` flag (-v, -vv, -vvv, etc.)
    3: print test trace for failing tests
    4: always print test trace, print setup for failing tests
    5: always print test trace and setup
]' \
'--debug[enable debugger]' \
'--optimize[activate the solidity optimizer]' \
'--no-auto-detect[if set to true, skips auto-detecting solc and uses what is in the user'\''s $PATH ]' \
'--force[force recompilation of the project, deletes the cache and artifacts folders]' \
'(-c --contracts)--hardhat[uses hardhat style project layout. This a convenience flag and is the same as `--contracts contracts --lib-paths node_modules`]' \
'--allow-failure[if set to true, the process will exit with an exit code = 0, even if the tests fail]' \
'-h[Print help information]' \
'--help[Print help information]' \
&& ret=0
;;
(build)
_arguments "${_arguments_options[@]}" \
'--root=[the project'\''s root path. By default, this is the root directory of the current Git repository or the current working directory if it is not part of a Git repository]:ROOT:_files -/' \
'-c+[the directory relative to the root under which the smart contracts are]:CONTRACTS:_files -/' \
'--contracts=[the directory relative to the root under which the smart contracts are]:CONTRACTS:_files -/' \
'*-r+[the remappings]:REMAPPINGS: ' \
'*--remappings=[the remappings]:REMAPPINGS: ' \
'--remappings-env=[the env var that holds remappings]:REMAPPINGS_ENV: ' \
'*--lib-paths=[the paths where your libraries are installed]:LIB_PATHS:_files -/' \
'-o+[path to where the contract artifacts are stored]:OUT_PATH:_files -/' \
'--out=[path to where the contract artifacts are stored]:OUT_PATH:_files -/' \
'--evm-version=[choose the evm version]:EVM_VERSION: ' \
'--optimize-runs=[optimizer parameter runs]:OPTIMIZE_RUNS: ' \
'*--ignored-error-codes=[ignore warnings with specific error codes]:IGNORED_ERROR_CODES: ' \
'*--libraries=[add linked libraries]:LIBRARIES: ' \
'--optimize[activate the solidity optimizer]' \
'--no-auto-detect[if set to true, skips auto-detecting solc and uses what is in the user'\''s $PATH ]' \
'--force[force recompilation of the project, deletes the cache and artifacts folders]' \
'(-c --contracts)--hardhat[uses hardhat style project layout. This a convenience flag and is the same as `--contracts contracts --lib-paths node_modules`]' \
'-h[Print help information]' \
'--help[Print help information]' \
&& ret=0
;;
(run)
_arguments "${_arguments_options[@]}" \
'--gas-limit=[the block gas limit]:GAS_LIMIT: ' \
'--chain-id=[the chainid opcode value]:CHAIN_ID: ' \
'--gas-price=[the tx.gasprice value during EVM execution]:GAS_PRICE: ' \
'--block-base-fee-per-gas=[the base fee in a block]:BLOCK_BASE_FEE_PER_GAS: ' \
'--tx-origin=[the tx.origin value during EVM execution]:TX_ORIGIN: ' \
'--block-coinbase=[the block.coinbase value during EVM execution]:BLOCK_COINBASE: ' \
'--block-timestamp=[the block.timestamp value during EVM execution]:BLOCK_TIMESTAMP: ' \
'--block-number=[the block.number value during EVM execution]:BLOCK_NUMBER: ' \
'--block-difficulty=[the block.difficulty value during EVM execution]:BLOCK_DIFFICULTY: ' \
'--block-gas-limit=[the block.gaslimit value during EVM execution]:BLOCK_GAS_LIMIT: ' \
'-e+[the EVM type you want to use (e.g. sputnik, evmodin)]:EVM_TYPE: ' \
'--evm-type=[the EVM type you want to use (e.g. sputnik, evmodin)]:EVM_TYPE: ' \
'-f+[fetch state over a remote instead of starting from empty state]:FORK_URL: ' \
'--fork-url=[fetch state over a remote instead of starting from empty state]:FORK_URL: ' \
'--fork-block-number=[pins the block number for the state fork]:FORK_BLOCK_NUMBER: ' \
'--initial-balance=[the initial balance of each deployed test contract]:INITIAL_BALANCE: ' \
'--sender=[the address which will be executing all tests]:SENDER: ' \
'--root=[the project'\''s root path. By default, this is the root directory of the current Git repository or the current working directory if it is not part of a Git repository]:ROOT:_files -/' \
'-c+[the directory relative to the root under which the smart contracts are]:CONTRACTS:_files -/' \
'--contracts=[the directory relative to the root under which the smart contracts are]:CONTRACTS:_files -/' \
'*-r+[the remappings]:REMAPPINGS: ' \
'*--remappings=[the remappings]:REMAPPINGS: ' \
'--remappings-env=[the env var that holds remappings]:REMAPPINGS_ENV: ' \
'*--lib-paths=[the paths where your libraries are installed]:LIB_PATHS:_files -/' \
'-o+[path to where the contract artifacts are stored]:OUT_PATH:_files -/' \
'--out=[path to where the contract artifacts are stored]:OUT_PATH:_files -/' \
'--evm-version=[choose the evm version]:EVM_VERSION: ' \
'--optimize-runs=[optimizer parameter runs]:OPTIMIZE_RUNS: ' \
'*--ignored-error-codes=[ignore warnings with specific error codes]:IGNORED_ERROR_CODES: ' \
'*--libraries=[add linked libraries]:LIBRARIES: ' \
'-t+[the contract you want to call and deploy, only necessary if there are more than 1 contract (Interfaces do not count) definitions on the script]:TARGET_CONTRACT: ' \
'--target-contract=[the contract you want to call and deploy, only necessary if there are more than 1 contract (Interfaces do not count) definitions on the script]:TARGET_CONTRACT: ' \
'-s+[the function you want to call on the script contract, defaults to run()]:SIG: ' \
'--sig=[the function you want to call on the script contract, defaults to run()]:SIG: ' \
'--ffi[enables the FFI cheatcode]' \
'*-v[Verbosity mode of EVM output as number of occurences of the `v` flag (-v, -vv, -vvv, etc.)
    3: print test trace for failing tests
    4: always print test trace, print setup for failing tests
    5: always print test trace and setup
]' \
'*--verbosity[Verbosity mode of EVM output as number of occurences of the `v` flag (-v, -vv, -vvv, etc.)
    3: print test trace for failing tests
    4: always print test trace, print setup for failing tests
    5: always print test trace and setup
]' \
'--debug[enable debugger]' \
'--optimize[activate the solidity optimizer]' \
'--no-auto-detect[if set to true, skips auto-detecting solc and uses what is in the user'\''s $PATH ]' \
'--force[force recompilation of the project, deletes the cache and artifacts folders]' \
'(-c --contracts)--hardhat[uses hardhat style project layout. This a convenience flag and is the same as `--contracts contracts --lib-paths node_modules`]' \
'-h[Print help information]' \
'--help[Print help information]' \
':path -- the path to the contract to run:_files' \
&& ret=0
;;
(update)
_arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
'::lib -- the submodule name of the library you want to update (will update all if none is provided):_files -/' \
&& ret=0
;;
(install)
_arguments "${_arguments_options[@]}" \
'--root=[the project'\''s root path. By default, this is the root directory of the current Git repository or the current working directory if it is not part of a Git repository]:ROOT:_files -/' \
'--no-git[install without creating a submodule repository]' \
'--no-commit[do not create a commit]' \
'-q[do not print messages]' \
'--quiet[do not print messages]' \
'-h[Print help information]' \
'--help[Print help information]' \
'*::dependencies -- installs one or more dependencies as git submodules (will install existing dependencies if no arguments are provided):' \
&& ret=0
;;
(remove)
_arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
'*::dependencies -- the submodule name of the library you want to remove:' \
&& ret=0
;;
(remappings)
_arguments "${_arguments_options[@]}" \
'--root=[the project'\''s root path, default being the current working directory]:ROOT:_files -/' \
'*--lib-paths=[the paths where your libraries are installed]:LIB_PATHS:_files -/' \
'-h[Print help information]' \
'--help[Print help information]' \
&& ret=0
;;
(verify-contract)
_arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
':contract -- contract source info `<path>\:<contractname>`:' \
':address -- the address of the contract to verify.:' \
'*::constructor-args -- constructor args calldata arguments.:' \
&& ret=0
;;
(create)
_arguments "${_arguments_options[@]}" \
'*--constructor-args=[constructor args calldata arguments.]:CONSTRUCTOR_ARGS: ' \
'--root=[the project'\''s root path. By default, this is the root directory of the current Git repository or the current working directory if it is not part of a Git repository]:ROOT:_files -/' \
'-c+[the directory relative to the root under which the smart contracts are]:CONTRACTS:_files -/' \
'--contracts=[the directory relative to the root under which the smart contracts are]:CONTRACTS:_files -/' \
'*-r+[the remappings]:REMAPPINGS: ' \
'*--remappings=[the remappings]:REMAPPINGS: ' \
'--remappings-env=[the env var that holds remappings]:REMAPPINGS_ENV: ' \
'*--lib-paths=[the paths where your libraries are installed]:LIB_PATHS:_files -/' \
'-o+[path to where the contract artifacts are stored]:OUT_PATH:_files -/' \
'--out=[path to where the contract artifacts are stored]:OUT_PATH:_files -/' \
'--evm-version=[choose the evm version]:EVM_VERSION: ' \
'--optimize-runs=[optimizer parameter runs]:OPTIMIZE_RUNS: ' \
'*--ignored-error-codes=[ignore warnings with specific error codes]:IGNORED_ERROR_CODES: ' \
'*--libraries=[add linked libraries]:LIBRARIES: ' \
'--rpc-url=[The tracing / archival node'\''s URL]:RPC_URL: ' \
'-f+[The sender account]:FROM: ' \
'--from=[The sender account]:FROM: ' \
'--private-key=[Your private key string]:PRIVATE_KEY: ' \
'--keystore=[Path to your keystore folder / file]:KEYSTORE_PATH: ' \
'--password=[Your keystore password]:KEYSTORE_PASSWORD: ' \
'--mnemonic-path=[Path to your mnemonic file]:MNEMONIC_PATH: ' \
'--hd-path=[Derivation path for your hardware wallet (trezor or ledger)]:HD_PATH: ' \
'--mnemonic_index=[your index in the standard hd path]:MNEMONIC_INDEX: ' \
'--etherscan-api-key=[]:ETHERSCAN_API_KEY: ' \
'--chain=[]:CHAIN: ' \
'--optimize[activate the solidity optimizer]' \
'--no-auto-detect[if set to true, skips auto-detecting solc and uses what is in the user'\''s $PATH ]' \
'--force[force recompilation of the project, deletes the cache and artifacts folders]' \
'(-c --contracts)--hardhat[uses hardhat style project layout. This a convenience flag and is the same as `--contracts contracts --lib-paths node_modules`]' \
'-i[Interactive prompt to insert your private key]' \
'--interactive[Interactive prompt to insert your private key]' \
'-l[Use your Ledger hardware wallet]' \
'--ledger[Use your Ledger hardware wallet]' \
'-t[Use your Trezor hardware wallet]' \
'--trezor[Use your Trezor hardware wallet]' \
'--flashbots[Use the flashbots RPC URL (https://rpc.flashbots.net)]' \
'--legacy[use legacy transactions instead of EIP1559 ones. this is auto-enabled for common networks without EIP1559]' \
'-h[Print help information]' \
'--help[Print help information]' \
':contract -- contract source info `<path>\:<contractname>` or `<contractname>`:' \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" \
'-t+[optional solidity template to start from]:TEMPLATE: ' \
'--template=[optional solidity template to start from]:TEMPLATE: ' \
'(-t --template)--no-git[initialize without creating a git repository]' \
'(-t --template)--no-commit[do not create initial commit]' \
'-q[do not print messages]' \
'--quiet[do not print messages]' \
'(-t --template)--offline[run without installing libs from the network]' \
'(-t --template)--force[force init if project dir is not empty]' \
'-h[Print help information]' \
'--help[Print help information]' \
'::root -- the project'\''s root path, default being the current working directory:_files -/' \
&& ret=0
;;
(completions)
_arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
':shell:(bash elvish fish powershell zsh)' \
&& ret=0
;;
(clean)
_arguments "${_arguments_options[@]}" \
'--root=[the project'\''s root path, default being the current working directory]:ROOT:_files -/' \
'-h[Print help information]' \
'--help[Print help information]' \
&& ret=0
;;
(snapshot)
_arguments "${_arguments_options[@]}" \
'--gas-limit=[the block gas limit]:GAS_LIMIT: ' \
'--chain-id=[the chainid opcode value]:CHAIN_ID: ' \
'--gas-price=[the tx.gasprice value during EVM execution]:GAS_PRICE: ' \
'--block-base-fee-per-gas=[the base fee in a block]:BLOCK_BASE_FEE_PER_GAS: ' \
'--tx-origin=[the tx.origin value during EVM execution]:TX_ORIGIN: ' \
'--block-coinbase=[the block.coinbase value during EVM execution]:BLOCK_COINBASE: ' \
'--block-timestamp=[the block.timestamp value during EVM execution]:BLOCK_TIMESTAMP: ' \
'--block-number=[the block.number value during EVM execution]:BLOCK_NUMBER: ' \
'--block-difficulty=[the block.difficulty value during EVM execution]:BLOCK_DIFFICULTY: ' \
'--block-gas-limit=[the block.gaslimit value during EVM execution]:BLOCK_GAS_LIMIT: ' \
'-e+[the EVM type you want to use (e.g. sputnik, evmodin)]:EVM_TYPE: ' \
'--evm-type=[the EVM type you want to use (e.g. sputnik, evmodin)]:EVM_TYPE: ' \
'-f+[fetch state over a remote instead of starting from empty state]:FORK_URL: ' \
'--fork-url=[fetch state over a remote instead of starting from empty state]:FORK_URL: ' \
'--fork-block-number=[pins the block number for the state fork]:FORK_BLOCK_NUMBER: ' \
'--initial-balance=[the initial balance of each deployed test contract]:INITIAL_BALANCE: ' \
'--sender=[the address which will be executing all tests]:SENDER: ' \
'-m+[only run test methods matching regex (deprecated, see --match-test, --match-contract)]:PATTERN: ' \
'--match=[only run test methods matching regex (deprecated, see --match-test, --match-contract)]:PATTERN: ' \
'(-m --match)--match-test=[only run test methods matching regex]:TEST_PATTERN: ' \
'(-m --match)--no-match-test=[only run test methods not matching regex]:TEST_PATTERN_INVERSE: ' \
'(-m --match)--match-contract=[only run test methods in contracts matching regex]:CONTRACT_PATTERN: ' \
'(-m --match)--no-match-contract=[only run test methods in contracts not matching regex]:CONTRACT_PATTERN_INVERSE: ' \
'--root=[the project'\''s root path. By default, this is the root directory of the current Git repository or the current working directory if it is not part of a Git repository]:ROOT:_files -/' \
'-c+[the directory relative to the root under which the smart contracts are]:CONTRACTS:_files -/' \
'--contracts=[the directory relative to the root under which the smart contracts are]:CONTRACTS:_files -/' \
'*-r+[the remappings]:REMAPPINGS: ' \
'*--remappings=[the remappings]:REMAPPINGS: ' \
'--remappings-env=[the env var that holds remappings]:REMAPPINGS_ENV: ' \
'*--lib-paths=[the paths where your libraries are installed]:LIB_PATHS:_files -/' \
'-o+[path to where the contract artifacts are stored]:OUT_PATH:_files -/' \
'--out=[path to where the contract artifacts are stored]:OUT_PATH:_files -/' \
'--evm-version=[choose the evm version]:EVM_VERSION: ' \
'--optimize-runs=[optimizer parameter runs]:OPTIMIZE_RUNS: ' \
'*--ignored-error-codes=[ignore warnings with specific error codes]:IGNORED_ERROR_CODES: ' \
'*--libraries=[add linked libraries]:LIBRARIES: ' \
'--min=[Only include tests that used more gas that the given amount.]:MIN: ' \
'--max=[Only include tests that used less gas that the given amount.]:MAX: ' \
'(--snap)--diff=[Compare against a snapshot and display changes from the snapshot. Takes an optional snapshot file, \[default: .gas-snapshot\]]:DIFF:_files' \
'(--diff)--check=[Run snapshot in '\''check'\'' mode and compares against an existing snapshot file, \[default: .gas-snapshot\]. Exits with 0 if snapshots match. Exits with 1 and prints a diff otherwise]:CHECK:_files' \
'--format=[How to format the output.]:FORMAT: ' \
'--snap=[Output file for the snapshot.]:SNAP: ' \
'-j[print the test results in json format]' \
'--json[print the test results in json format]' \
'--ffi[enables the FFI cheatcode]' \
'*-v[Verbosity mode of EVM output as number of occurences of the `v` flag (-v, -vv, -vvv, etc.)
    3: print test trace for failing tests
    4: always print test trace, print setup for failing tests
    5: always print test trace and setup
]' \
'*--verbosity[Verbosity mode of EVM output as number of occurences of the `v` flag (-v, -vv, -vvv, etc.)
    3: print test trace for failing tests
    4: always print test trace, print setup for failing tests
    5: always print test trace and setup
]' \
'--debug[enable debugger]' \
'--optimize[activate the solidity optimizer]' \
'--no-auto-detect[if set to true, skips auto-detecting solc and uses what is in the user'\''s $PATH ]' \
'--force[force recompilation of the project, deletes the cache and artifacts folders]' \
'(-c --contracts)--hardhat[uses hardhat style project layout. This a convenience flag and is the same as `--contracts contracts --lib-paths node_modules`]' \
'--allow-failure[if set to true, the process will exit with an exit code = 0, even if the tests fail]' \
'--asc[sort results by ascending gas used.]' \
'(--asc)--desc[sort results by descending gas used.]' \
'-h[Print help information]' \
'--help[Print help information]' \
&& ret=0
;;
(config)
_arguments "${_arguments_options[@]}" \
'--root=[the project'\''s root path. By default, this is the root directory of the current Git repository or the current working directory if it is not part of a Git repository]:ROOT:_files -/' \
'-c+[the directory relative to the root under which the smart contracts are]:CONTRACTS:_files -/' \
'--contracts=[the directory relative to the root under which the smart contracts are]:CONTRACTS:_files -/' \
'*-r+[the remappings]:REMAPPINGS: ' \
'*--remappings=[the remappings]:REMAPPINGS: ' \
'--remappings-env=[the env var that holds remappings]:REMAPPINGS_ENV: ' \
'*--lib-paths=[the paths where your libraries are installed]:LIB_PATHS:_files -/' \
'-o+[path to where the contract artifacts are stored]:OUT_PATH:_files -/' \
'--out=[path to where the contract artifacts are stored]:OUT_PATH:_files -/' \
'--evm-version=[choose the evm version]:EVM_VERSION: ' \
'--optimize-runs=[optimizer parameter runs]:OPTIMIZE_RUNS: ' \
'*--ignored-error-codes=[ignore warnings with specific error codes]:IGNORED_ERROR_CODES: ' \
'*--libraries=[add linked libraries]:LIBRARIES: ' \
'--gas-limit=[the block gas limit]:GAS_LIMIT: ' \
'--chain-id=[the chainid opcode value]:CHAIN_ID: ' \
'--gas-price=[the tx.gasprice value during EVM execution]:GAS_PRICE: ' \
'--block-base-fee-per-gas=[the base fee in a block]:BLOCK_BASE_FEE_PER_GAS: ' \
'--tx-origin=[the tx.origin value during EVM execution]:TX_ORIGIN: ' \
'--block-coinbase=[the block.coinbase value during EVM execution]:BLOCK_COINBASE: ' \
'--block-timestamp=[the block.timestamp value during EVM execution]:BLOCK_TIMESTAMP: ' \
'--block-number=[the block.number value during EVM execution]:BLOCK_NUMBER: ' \
'--block-difficulty=[the block.difficulty value during EVM execution]:BLOCK_DIFFICULTY: ' \
'--block-gas-limit=[the block.gaslimit value during EVM execution]:BLOCK_GAS_LIMIT: ' \
'-e+[the EVM type you want to use (e.g. sputnik, evmodin)]:EVM_TYPE: ' \
'--evm-type=[the EVM type you want to use (e.g. sputnik, evmodin)]:EVM_TYPE: ' \
'-f+[fetch state over a remote instead of starting from empty state]:FORK_URL: ' \
'--fork-url=[fetch state over a remote instead of starting from empty state]:FORK_URL: ' \
'--fork-block-number=[pins the block number for the state fork]:FORK_BLOCK_NUMBER: ' \
'--initial-balance=[the initial balance of each deployed test contract]:INITIAL_BALANCE: ' \
'--sender=[the address which will be executing all tests]:SENDER: ' \
'--json[prints currently set config values as json]' \
'--basic[prints basic set of currently set config values]' \
'--optimize[activate the solidity optimizer]' \
'--no-auto-detect[if set to true, skips auto-detecting solc and uses what is in the user'\''s $PATH ]' \
'--force[force recompilation of the project, deletes the cache and artifacts folders]' \
'(-c --contracts)--hardhat[uses hardhat style project layout. This a convenience flag and is the same as `--contracts contracts --lib-paths node_modules`]' \
'--ffi[enables the FFI cheatcode]' \
'*-v[Verbosity mode of EVM output as number of occurences of the `v` flag (-v, -vv, -vvv, etc.)
    3: print test trace for failing tests
    4: always print test trace, print setup for failing tests
    5: always print test trace and setup
]' \
'*--verbosity[Verbosity mode of EVM output as number of occurences of the `v` flag (-v, -vv, -vvv, etc.)
    3: print test trace for failing tests
    4: always print test trace, print setup for failing tests
    5: always print test trace and setup
]' \
'--debug[enable debugger]' \
'-h[Print help information]' \
'--help[Print help information]' \
&& ret=0
;;
(flatten)
_arguments "${_arguments_options[@]}" \
'-o+[output path for the flattened contract]:OUTPUT:_files' \
'--output=[output path for the flattened contract]:OUTPUT:_files' \
'--root=[the project'\''s root path. By default, this is the root directory of the current Git repository or the current working directory if it is not part of a Git repository]:ROOT:_files -/' \
'-c+[the directory relative to the root under which the smart contracts are]:CONTRACTS:_files -/' \
'--contracts=[the directory relative to the root under which the smart contracts are]:CONTRACTS:_files -/' \
'*-r+[the remappings]:REMAPPINGS: ' \
'*--remappings=[the remappings]:REMAPPINGS: ' \
'--remappings-env=[]:REMAPPINGS_ENV: ' \
'*--lib-paths=[the paths where your libraries are installed]:LIB_PATHS:_files -/' \
'(-c --contracts)--hardhat[uses hardhat style project layout. This a convenience flag and is the same as `--contracts contracts --lib-paths node_modules`]' \
'-h[Print help information]' \
'--help[Print help information]' \
':target-path -- the path to the contract to flatten:_files' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
'*::subcommand -- The subcommand whose help message to display:' \
&& ret=0
;;
        esac
    ;;
esac
}

(( $+functions[_forge_commands] )) ||
_forge_commands() {
    local commands; commands=(
'test:test your smart contracts' \
'build:build your smart contracts' \
'run:run a single smart contract as a script' \
'update:fetches all upstream lib changes' \
'install:installs one or more dependencies as git submodules (will install existing dependencies if no arguments are provided' \
'remove:removes one or more dependencies from git submodules' \
'remappings:prints the automatically inferred remappings for this repository' \
'verify-contract:verify your smart contracts source code on Etherscan. Requires `ETHERSCAN_API_KEY` to be set.' \
'create:deploy a compiled contract' \
'init:initializes a new forge sample project' \
'completions:generate shell completions script' \
'clean:removes the build artifacts and cache directories' \
'snapshot:creates a snapshot of each test'\''s gas usage' \
'config:shows the currently set config values' \
'flatten:concats a file with all of its imports' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'forge commands' commands "$@"
}
(( $+functions[_forge__build_commands] )) ||
_forge__build_commands() {
    local commands; commands=()
    _describe -t commands 'forge build commands' commands "$@"
}
(( $+functions[_forge__clean_commands] )) ||
_forge__clean_commands() {
    local commands; commands=()
    _describe -t commands 'forge clean commands' commands "$@"
}
(( $+functions[_forge__completions_commands] )) ||
_forge__completions_commands() {
    local commands; commands=()
    _describe -t commands 'forge completions commands' commands "$@"
}
(( $+functions[_forge__config_commands] )) ||
_forge__config_commands() {
    local commands; commands=()
    _describe -t commands 'forge config commands' commands "$@"
}
(( $+functions[_forge__create_commands] )) ||
_forge__create_commands() {
    local commands; commands=()
    _describe -t commands 'forge create commands' commands "$@"
}
(( $+functions[_forge__flatten_commands] )) ||
_forge__flatten_commands() {
    local commands; commands=()
    _describe -t commands 'forge flatten commands' commands "$@"
}
(( $+functions[_forge__help_commands] )) ||
_forge__help_commands() {
    local commands; commands=()
    _describe -t commands 'forge help commands' commands "$@"
}
(( $+functions[_forge__init_commands] )) ||
_forge__init_commands() {
    local commands; commands=()
    _describe -t commands 'forge init commands' commands "$@"
}
(( $+functions[_forge__install_commands] )) ||
_forge__install_commands() {
    local commands; commands=()
    _describe -t commands 'forge install commands' commands "$@"
}
(( $+functions[_forge__remappings_commands] )) ||
_forge__remappings_commands() {
    local commands; commands=()
    _describe -t commands 'forge remappings commands' commands "$@"
}
(( $+functions[_forge__remove_commands] )) ||
_forge__remove_commands() {
    local commands; commands=()
    _describe -t commands 'forge remove commands' commands "$@"
}
(( $+functions[_forge__run_commands] )) ||
_forge__run_commands() {
    local commands; commands=()
    _describe -t commands 'forge run commands' commands "$@"
}
(( $+functions[_forge__snapshot_commands] )) ||
_forge__snapshot_commands() {
    local commands; commands=()
    _describe -t commands 'forge snapshot commands' commands "$@"
}
(( $+functions[_forge__test_commands] )) ||
_forge__test_commands() {
    local commands; commands=()
    _describe -t commands 'forge test commands' commands "$@"
}
(( $+functions[_forge__update_commands] )) ||
_forge__update_commands() {
    local commands; commands=()
    _describe -t commands 'forge update commands' commands "$@"
}
(( $+functions[_forge__verify-contract_commands] )) ||
_forge__verify-contract_commands() {
    local commands; commands=()
    _describe -t commands 'forge verify-contract commands' commands "$@"
}

_forge "$@"
