%lang starknet
from src.main import balance, increase_balance
from starkware.cairo.common.cairo_builtins import HashBuiltin

//
// Interface
//

@contract_interface
namespace TestContract {
    func increase_balance_test(amount: felt) {
    }
    func get_balance_test() -> (balance: felt) {
    }
    func balance_calculation_helper_test(balance: felt) -> (new_balance: felt) {
    }
}

@external
func __setup__() {
    %{ context.contract_address = deploy_contract('./src/test/test_main.cairo', [100]).contract_address %}
    return ();
}

@external
func test_balance_calculation_helper{
    syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*
}(balance: felt) {
    alloc_locals;
    local address;
    %{ ids.address = context.contract_address %}
    let (new_balance) = TestContract.balance_calculation_helper_test(
        contract_address=address, balance=balance
    );

    %{ assert ids.new_balance == ids.balance + 1 %}

    return ();
}
