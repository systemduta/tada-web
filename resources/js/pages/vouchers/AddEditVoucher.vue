<template>
    <div class="app-main__outer">
        <div class="app-main__inner">
            <div class="row">
                <div class="col-sm-12">
                    <div class="main-card mb-3 card">
                        <div class="card-header">
                            {{ this.$route.params.id ? 'Edit' : 'Add' }} Voucher
                        </div>
                        <div class="card-body">
                            <form class="" @submit.prevent="storeData()">
                                <div class="position-relative form-group">
                                    <label for="voucherName" class="">Name</label>
                                    <input name="voucherName" id="voucherName" type="text" class="form-control" v-model="payload.name">
                                </div>
                                <div class="position-relative form-group">
                                    <label for="voucherDescription" class="">Description</label>
                                    <textarea name="voucherDescription" id="voucherDescription" class="form-control" v-model="payload.description"></textarea>
                                </div>
                                <div class="position-relative form-group">
                                    <label for="minTrx" class="">Minimal Transaction</label>
                                    <input name="minTrx" id="minTrx" type="number" class="form-control" v-model="payload.min_transaction">
                                </div>
                                <div class="position-relative form-group">
                                    <label for="voucherValue" class="">Value</label>
                                    <input name="voucherValue" id="voucherValue" type="number" class="form-control" v-model="payload.value">
                                </div>
                                <div class="position-relative form-group">
                                    <label for="voucherExpiration" class="">Expiration</label>
                                    <input name="voucherExpiration" id="voucherExpiration" type="number" class="form-control" v-model="payload.expiration" :disabled="this.$route.params.id">
                                </div>
                                <div class="position-relative form-group">
                                    <label for="voucherBackground" class="">Background</label>
                                    <input name="voucherBackground" id="voucherBackground" type="file" class="form-control-file" accept="image/*" @change="readImage($event)">
                                </div>
                                <div class="position-relative form-group">
                                    <button type="submit" class="mt-1 btn btn-primary">Submit</button>
                                </div>
                            </form>
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
import imageCompression from "browser-image-compression";
import Api from "../../api";
import toastr from "toastr";

export default {
    name: "AddEditVoucher",
    data() {
        return {
            isLoading: false,
            payload: {
                name: null,
                description: null,
                min_transaction: null,
                value: null,
                expiration: null,
                background: null,
            }
        }
    },
    methods: {
        async readImage(event) {
            this.$set(this,'isLoading',true);
            let photo = event.target.files[0];
            const options = {
                maxSizeMB: 1,
                maxWidthOrHeight: 1024,
                useWebWorker: false
            };
            try {
                this.$set(this.payload, 'background', await imageCompression(photo, options)
                    .then(blob => new File([blob], blob.name)));
                this.$set(this,'isLoading',false);
            } catch (error) {
                this.$set(this,'isLoading',false);
            }
            return photo;
        },
        clearForm() {
            this.$set(this.payload,'name',null);
            this.$set(this.payload,'description',null);
            this.$set(this.payload,'min_transaction',null);
            this.$set(this.payload,'value',null);
            this.$set(this.payload,'expiration',null);
            this.$set(this.payload,'background',null);

        },
        convertToFormData: function () {
            let data = new FormData;
            ['name','description','min_transaction','value','expiration','background'].forEach((key) => {
                if (this.payload[key]) data.append(`${key}`, this.payload[key]);
            });
            if (this.$route.params.id) data.append(`_method`, `PUT`);
            return data;
        },
        fetchVoucher() {
            this.$set(this,'isLoading',true);
            Api.voucher.show(this.$route.params.id,{}).then((res)=>{
                let data = res.data.data;
                this.$set(this.payload,'name', data.name);
                this.$set(this.payload,'description', data.description);
                this.$set(this.payload,'min_transaction', data.min_transaction);
                this.$set(this.payload,'value', data.value);
                this.$set(this.payload,'expiration', data.expiration);
                this.$set(this,'isLoading',false);
            }).catch((err)=>{
                toastr.options.progressBar = true;
                toastr.error(err.response.data.message ? err.response.data.message : err.response.data.exception.split('\\').pop());
                this.$set(this,'isLoading',false);
            })
        },
        storeData() {
            this.$set(this,'isLoading',true);
            let payload = this.convertToFormData();
            if (this.$route.params.id) {
                Api.voucher.update(this.$route.params.id, payload).then((res)=>{
                    this.$set(this,'isLoading',false);
                    this.clearForm();
                    toastr.options.progressBar = true;
                    toastr.success('Your voucher has been successfully updated','Successful updated');
                    this.$router.push("/voucher");
                }).catch((err)=>{
                    toastr.options.progressBar = true;
                    toastr.error(err.response.data.message ? err.response.data.message : err.response.data.exception.split('\\').pop());
                    this.$set(this,'isLoading',false);
                });
            } else {
                Api.voucher.store(payload).then((res)=>{
                    this.$set(this,'isLoading',false);
                    this.clearForm();
                    toastr.options.progressBar = true;
                    toastr.success('Your voucher has been successfully created','Successful created');
                    this.$router.push("/voucher");
                }).catch((err)=>{
                    toastr.options.progressBar = true;
                    toastr.error(err.response.data.message ? err.response.data.message : err.response.data.exception.split('\\').pop());
                    this.$set(this,'isLoading',false);
                });
            }
        },
    },
    mounted() {
        if (this.$route.params.id) this.fetchVoucher();
    }
}
</script>

<style scoped>

</style>
