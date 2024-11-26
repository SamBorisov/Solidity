const contract = myContract;
const function = myFunction;
const inputForFunction = "";

// Be aware for external calls we midth neweed to user another contract interface to see the right error!

try {
        await contract.function.staticCall(inputForFunction);
      } catch (err) {
        let outputErr = err;
        if (ethers.isCallException(err) && err.data) {
          outputErr = contract.interface.parseError(err.data);
        }

        console.error(`Custom error`, outputErr);
      }
