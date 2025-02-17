# full input: 00000000000000000000000000000000000000000000000000000000000000009e00ffdd6102321bc251e4a5190ad5b12b251069d9b4904e02030400000002037a0000000a076501000000013100020000ffdd6102321bc251e4a5190ad5b12b251069d9b4010100000000000000000000000000000000000000000000000008530a0a530a530a53
# signer: tz1dyX3B1CFYa2DfdFLyPtiJCfQRUgPVME6E
start_speculos "$seed"
expect_full_text 'Tezos Wallet' 'ready for' 'safe signing'
send_async_apdus \
        800f000011048000002c800006c18000000080000000 "expect_apdu_return 9000" \
        800f8100890300000000000000000000000000000000000000000000000000000000000000009e00ffdd6102321bc251e4a5190ad5b12b251069d9b4904e02030400000002037a0000000a076501000000013100020000ffdd6102321bc251e4a5190ad5b12b251069d9b4010100000000000000000000000000000000000000000000000008530a0a530a530a53 "expect_apdu_return ba220e5b9af0fa350d127665049ef6dcc85304a6bd62fcc5e4f12752092af1f703399e1639e7884f86b83714e5eea2acdc56d3449f029e7258ef3bbbd35f449105d9545c3c62f7ffa088d3dfebcfa38cd316e2b4d4067cf288e9e275b8fe69019000"
expect_section_content nanosp 'Operation (0)' 'Transfer ticket'
press_button right
expect_section_content nanosp 'Fee' '0.01 tz'
press_button right
expect_section_content nanosp 'Storage limit' '4'
press_button right
expect_section_content nanosp 'Contents' 'UNPAIR'
press_button right
expect_section_content nanosp 'Type' 'pair "1" 2'
press_button right
expect_section_content nanosp 'Ticketer' 'tz1ixvCiPJYyMjsp2nKBVaq54f6AdbV8hCKa'
press_button right
expect_section_content nanosp 'Amount' '1'
press_button right
expect_section_content nanosp 'Destination' 'KT18amZmM5W7qDWVt2pH6uj7sCEd3kbzLrHT'
press_button right
expect_section_content nanosp 'Entrypoint' 'S

S
S
S'
press_button right
expect_full_text 'Accept?' 'Press both buttons to accept.'
press_button both
expect_async_apdus_sent
