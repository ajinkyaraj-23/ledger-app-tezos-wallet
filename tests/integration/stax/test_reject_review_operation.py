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

def short_reject(app):
    app.assert_screen(SCREEN_HOME_DEFAULT)

    app.send_apdu("800f000011048000002c800006c18000000080000000")
    app.expect_apdu_return("9000")

    app.send_apdu("800f81005e0300000000000000000000000000000000000000000000000000000000000000006c016e8874874d31c3fbd636e924d5a036a43ec8faa7d0860308362d80d30e01000000000000000000000000000000000000000000ff02000000020316");

    app.assert_screen("review_request_sign_operation")

    app.review_reject_signing()

    app.review.tap()
    app.assert_screen(SCREEN_HOME_DEFAULT)
    app.expect_apdu_failure("6985")

if __name__ == "__main__":
    app = stax_app()

    short_reject(app)
    # Ensure we can immediately send a new packet - the global state
    # should have been reset correctly
    short_reject(app)

    app.welcome.quit()
