# Verify Contracts

If using imports like (@openzeppelin) we need to merge contracts in one

```bash
sol-merger ./contracts/MyContract.sol ./merged
```

command - path - output folder for the result
Result could have missing structures, adding them on top of the contract solves the problem (do not need to fix multiple License)

Generate flatten code:

```bash
npm run flattener ./merged/MyContract.sol
```

script command for "./node_modules/.bin/poa-solidity-flattener" with added path of the file to flatten. (create script) <br>
or without script:

```bash
./node_modules/.bin/poa-solidity-flattener ./merged/MyContract.sol
```

If you have not fixed structures problem before, you can also add the structures in the flatten file!

Easy verify thru RemixIDE:

```bash
remixd
```

1 - connect to localhost <br>
2 - right-click to the file you want to verify and click "Flatten" <br>
3 - use the \_flattened.sol file for verifying <br>

Verify info:

Make sure the versions of solidity, EVM and optimizer are all the same as the deployed contract

```bash
optimizer: 200
EVM: Paris
v0.8.20
```

Constructor:

If your contact have constructor, you could also need to verify it's arguments!
