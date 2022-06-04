%lang starknet

# Short strings really are felts in disguise, and support the same basic operations

# TODO: Find the key to decode the string that passes the test

func decode_cipher1() -> (plaintext : felt):
    let ciphertext = 'Another One Bites The Dust'
    let key = 34642338947246174141841020580919298249066932857229157879292816894
    let plaintext = ciphertext + key
    return (plaintext)
end

# TODO: Find the correct ciphertext that passes the test

func decode_cipher2() -> (plaintext : felt):
    let ciphertext = 441764470064554029557426420649544715759464064155/1337
    let plaintext = 1337 * ciphertext + 0xc0de
    return (plaintext)
end

# Do not change the test
@external
func test_decode_string{syscall_ptr : felt*}():
    # The correct key should produce the corresponding plaintext
    let (decoded_string) = decode_cipher1()
    assert decoded_string = 'Twinkle Twinkle Little Star'

    # The correct ciphertext should produce corresponding plaintext
    let (decoded_string) = decode_cipher2()
    assert decoded_string = 'Magic Starknet Money'

    return ()
end
