<template>
    <div class="app-main__outer">
        <div class="app-main__inner">
            <div class="row">
                <div class="col-sm-12">
                    <div class="main-card mb-3 card">
                        <div class="card-header">
                            Create Transaction
                        </div>
                        <div class="card-body">
                            <form class="">
                                <div class="position-relative form-group">
                                    <label for="voucherName" class="">Total Price</label>
                                    <input name="voucherName" id="voucherName" type="number" class="form-control" v-model="total_price">
                                </div>
                            </form>
                            <p class="error">{{ error }}</p>

                            <p class="decode-result">Last result: <b>{{ result }}</b></p>

                            <qrcode-stream @decode="onDecode" @init="onInit" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <loading :active.sync="isLoading"
                 :can-cancel="false"
                 :is-full-page="true"
                 color="#007bff"
        />
    </div>
</template>

<script>
import { QrcodeStream } from 'vue-qrcode-reader'
export default {
    name: "CreateTransaction",
    components: { QrcodeStream },
    data () {
        return {
            isLoading: false,
            result: '',
            error: '',
            total_price: null
        }
    },
    methods: {
        onDecode(result) {
            this.result = result
        },

        async onInit(promise) {
            try {
                await promise
            } catch (error) {
                if (error.name === 'NotAllowedError') {
                    this.error = "ERROR: you need to grant camera access permisson"
                } else if (error.name === 'NotFoundError') {
                    this.error = "ERROR: no camera on this device"
                } else if (error.name === 'NotSupportedError') {
                    this.error = "ERROR: secure context required (HTTPS, localhost)"
                } else if (error.name === 'NotReadableError') {
                    this.error = "ERROR: is the camera already in use?"
                } else if (error.name === 'OverconstrainedError') {
                    this.error = "ERROR: installed cameras are not suitable"
                } else if (error.name === 'StreamApiNotSupportedError') {
                    this.error = "ERROR: Stream API is not supported in this browser"
                }
            }
        }
    }
}
</script>

<style scoped>
.error {
    font-weight: bold;
    color: red;
}
</style>
