#!/usr/bin/env python3
# Copyright 2023 Trilitech <contact@trili.tech>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

# http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from utils import *

# full input: 0300000000000000000000000000000000000000000000000000000000000000006c016e8874874d31c3fbd636e924d5a036a43ec8faa7d0860308362d80d30e01000000000000000000000000000000000000000000ff02000000020316
# full output: CAR
# signer: tz1dyX3B1CFYa2DfdFLyPtiJCfQRUgPVME6E
# path: m/44'/1729'/0'/0'

if __name__ == "__main__":
    app = stax_app()

    app.assert_screen(SCREEN_HOME_DEFAULT)

    app.send_apdu("800f000011048000002c800006c18000000080000000");
    app.expect_apdu_return("9000");

    app.assert_screen("review_request_sign_operation");

    app.send_apdu("800f81005e0300000000000000000000000000000000000000000000000000000000000000006c016e8874874d31c3fbd636e924d5a036a43ec8faa7d0860308362d80d30e01000000000000000000000000000000000000000000ff02000000020316");

    app.review.tap()
    app.assert_screen("operation_0_transaction")

    app.review_skip_to_signing()
    app.assert_screen("operation_sign")

    expected_apdu = "f6d5fa0e79cac216e25104938ac873ca17ee9d7f06763719293b413cf2ed475cf63d045a1cc9f73eee5775c5d496fa9d3aa9ae57fb97217f746a8728639795b7b2220e84ce5759ed111399ea3263d810c230d6a4fffcb6e82797c5ca673a17089000"

    app.review_confirm_signing(expected_apdu)

    app.assert_screen(SCREEN_HOME_DEFAULT)
    app.welcome.quit()
