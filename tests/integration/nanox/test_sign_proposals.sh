# full input: 00000000000000000000000000000000000000000000000000000000000000000500ffdd6102321bc251e4a5190ad5b12b251069d9b400000020000000400bcd7b2cadcd87ecb0d5c50330fb59feed7432bffecede8a09a2b86cfb33847b0bcd7b2cadcd87ecb0d5c50330fb59feed7432bffecede8a09a2b86dac301a2d
# signer: tz1dyX3B1CFYa2DfdFLyPtiJCfQRUgPVME6E
start_speculos "$seed"
expect_full_text 'Tezos Wallet' 'ready for' 'safe signing'
send_async_apdus \
	800f000011048000002c800006c18000000080000000 "expect_apdu_return 9000" \
	800f81007f0300000000000000000000000000000000000000000000000000000000000000000500ffdd6102321bc251e4a5190ad5b12b251069d9b400000020000000400bcd7b2cadcd87ecb0d5c50330fb59feed7432bffecede8a09a2b86cfb33847b0bcd7b2cadcd87ecb0d5c50330fb59feed7432bffecede8a09a2b86dac301a2d "expect_apdu_return 71f5f45b1ccf3f57647f84465be2dd5e049c6b3cf1b67a5db15c33fc89f1e660d23d7ffe172d4a5c66e48bd2384cea19367d9255da631339ba8b12a071e697b9481b101f72607b3dd8f8dc736624ae9749adb97a1ff1a2ad2a31a1ac4645180e9000"
expect_section_content nanox 'Operation (0)' 'Proposals'
press_button right
expect_section_content nanox 'Source' 'tz1ixvCiPJYyMjsp2nKBVaq54f6AdbV8hCKa'
press_button right
expect_section_content nanox 'Period' '32'
press_button right
expect_section_content nanox 'Proposal (0)' 'ProtoALphaALphaALphaALphaALphaALphaALpha61322gcLUGH'
press_button right
expect_section_content nanox 'Proposal (1)' 'ProtoALphaALphaALphaALphaALphaALphaALphabc2a7ebx6WB'
press_button right
expect_full_text 'Accept?' 'Press both buttons to accept.'
press_button both
expect_async_apdus_sent
