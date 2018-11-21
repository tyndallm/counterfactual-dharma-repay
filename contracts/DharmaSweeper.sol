pragma solidity ^0.4.24;

/**
 * Based on Austin Griffith's Counterfactual Sweeper contract
 * https://github.com/austintgriffith/counterfactual-token-repayment/blob/master/contracts/Sweeper/Sweeper.sol
 *
 * Upon creation, this contract will make a repayment on behalf of a debtor
<<<<<<< HEAD
 *
 * agreementId - Dharma loan agreement ID
 * repaymentRouter - Address of Dharma's RepaymentRouter contract
 * tokenTransferProxy - Address of Dharma's token proxy contract
 * tokenAddress - Address of ERC20 token being repaid
 * gasRefund - Address that any remaining ETH should be returned to
 * amount - Amount of ERC20 token being repaid
=======
>>>>>>> 20a51f010ccaa8a48c0fd3b98a75fcfcb5bffacf
 */
contract DharmaSweeper {

    constructor(
        bytes32 agreementId,
        address repaymentRouter,
        address tokenTransferProxy,
        address tokenAddress,
<<<<<<< HEAD
        address gasRefund,
=======
>>>>>>> 20a51f010ccaa8a48c0fd3b98a75fcfcb5bffacf
        uint256 amount
    )
        public
    {
        // approve Dharma's tokenTransferProxy
        IERC20(tokenAddress).approve(tokenTransferProxy, amount);
        // make the repayment
        IRepaymentRouter(repaymentRouter).repay(agreementId, amount, tokenAddress);
        // destroy contract
<<<<<<< HEAD
        selfdestruct(gasRefund);
=======
        selfdestruct(tokenTransferProxy);
>>>>>>> 20a51f010ccaa8a48c0fd3b98a75fcfcb5bffacf
    }
}

contract IERC20 {
    function approve(address spender, uint256 value) external {}
}

contract IRepaymentRouter {
    function repay(bytes32 agreementId, uint256 amount, address tokenAddress) external {}
}