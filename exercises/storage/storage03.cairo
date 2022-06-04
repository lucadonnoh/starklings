%lang starknet

# You can update stored values using externals, or just consult them (for free) using views

@storage_var
func bool() -> (bool : felt):
end

@external
func toggle{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}():
    let (b) = view_bool()
    let res = 1 - b
    bool.write(res)
    return ()
end

@view
func view_bool{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}() -> (
    bool : felt
):
    let (b) = bool.read()
    return (b)
end

# TESTS #

from starkware.cairo.common.cairo_builtins import HashBuiltin

@external
func test_toggle_and_view{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}():
    let (x) = view_bool()
    assert x = 0

    toggle()

    let (x) = view_bool()
    assert x = 1

    toggle()

    let (x) = view_bool()
    assert x = 0

    return ()
end
