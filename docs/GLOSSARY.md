# Glossary

| Term | Meaning in this course |
|---|---|
| ABI | Schema and encoding rules for contract interaction |
| Account | An address-associated participant with balance and, for a contract, code/state |
| Address | An account identifier; not proof of a unique real-world person |
| Array | Ordered values of one type, indexed from zero |
| Batch | A bounded amount of work processed in one call |
| Bytecode | Compiled instructions executed by the EVM |
| Calldata | Read-only input data for a call |
| Constructor | Initialization executed once during deployment |
| Contract instance | One deployment with its own address and state |
| Custom error | Named revert information with typed arguments |
| Cursor | Stored position for continuing a sequence of batches |
| Event | A structured log emitted by successful execution |
| EVM | Ethereum Virtual Machine |
| Gas | Metering units for execution work |
| Getter | A function that returns a value, including generated public-variable readers |
| Immutable | State configured at construction and not changed later |
| Interface | Description of an externally callable API |
| Invariant | A property that should remain true across allowed operations |
| Iteration | One execution of a loop body |
| Mapping | Storage association from a key to a value |
| Memory | Temporary mutable data in the call context |
| Modifier | Reusable logic wrapped around a function body |
| msg.sender | Immediate caller of the current message call |
| msg.value | Wei supplied to the current call |
| Payable | Able to accept Ether with the call |
| Pure | Function annotation forbidding contract-state reads and writes |
| Reentrancy | Calling back into a contract before an earlier interaction has finished |
| Revert | Failure that rolls back changes in the reverted execution |
| Salt | Extra preimage input, often unpredictable, used to resist guessing or separate hashes |
| Selector | First four bytes of a canonical function-signature hash |
| Storage | Persistent contract data in the ordinary state model |
| Struct | A record grouping named fields |
| Transaction | A submitted state-transition request that can contain many message calls |
| View | Function annotation permitting reads but forbidding state changes |
| Wei | Smallest Ether unit; 10**18 wei equals one ether |

[Course home](../README.md)
