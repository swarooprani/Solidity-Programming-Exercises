# Worked solutions

Attempt the [exercises](exercises.md) first. The complete commented implementation is in [solutions.sol](solutions.sol). Each exercise is one step of the same topic; deploy the named solution contract(s) and run the stated cases.

## 11.1: Override a fee

Create BaseFee.fee() public pure virtual returning 5, and StudentFee overriding it to return 2. Deploy each and compare.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 11.2: Extend with super

Create PremiumFee inheriting BaseFee. Its fee returns super.fee() + 3, so the result is 8. Do not hard-code 8 in the implementation.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 11.3: Implement an abstraction

Create abstract Area with area() public view virtual returning uint256. Rectangle stores width and height supplied at construction and implements area(). Deploy with (3,4) → 12; (0,4) → 0. Arithmetic overflow reverts.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

[Back to lesson](README.md)

## Why the implementations work

**Exercise 1.** virtual declares the extension point; override supplies the derived fee without changing BaseFee’s own behavior.

**Exercise 2.** super reuses the inherited calculation before adding three, so the extension follows the base implementation.

**Exercise 3.** The abstract declaration defines the required API, and Rectangle implements it using the two constructor-provided dimensions.
