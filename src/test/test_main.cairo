%lang starknet
from starkware.cairo.common.cairo_builtins import HashBuiltin
from src.main import increase_balance, get_balance, _balance_calculation_helper, constructor

@external
func increase_balance_test{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    amount: felt
) {
    increase_balance(amount=amount);
    return ();
}

@external
func get_balance_test{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (
    balance: felt
) {
    let (res) = get_balance();
    return (balance=res);
}

@external
func balance_calculation_helper_test{
    syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr
}(balance: felt) -> (new_balance: felt) {
    let (res) = _balance_calculation_helper(balance=balance);
    return (new_balance=res);
}
