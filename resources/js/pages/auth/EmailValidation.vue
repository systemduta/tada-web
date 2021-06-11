<template>
    <div class="app-container app-theme-white body-tabs-shadow">
        <div class="app-container">
            <div class="h-100 bg-plum-plate bg-animation">
                <div class="d-flex h-100 justify-content-center align-items-center">
                    <div class="mx-auto app-login-box col-md-8">
                        <div class="modal-dialog w-100 mx-auto">
                            <div class="modal-content" v-if="isValidation">
                                <div class="modal-body">
                                    <div class="modal-title text-center mb-3">
                                        <h5 class="mt-2 h5">Masukkan kode verifikasi</h5>
                                        <span>Kode verifikasi telah dikirim ke email Anda. Silahkan cek email Anda.</span>
                                    </div>
                                    <form class="">
                                        <div class="form-row">
                                            <div class="col-md-12">
                                                <div class="position-relative form-group">
                                                    <input name="verificationCode" id="verificationCode" placeholder="Kode verifikasi..." type="number" class="form-control" v-model="validation_code">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="divider"></div>
                                    <h6 class="mb-0">Belum menerima kode? <a href="javascript:void(0);" class="text-primary" @click="isValidation=false">Kirim Ulang Kode</a></h6>
                                </div>
                                <div class="modal-footer clearfix">
                                    <div class="float-right">
                                        <button class="btn btn-primary btn-lg" @click="validateEmail">Validasi Kode</button>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-content" v-else>
                                <div class="modal-body">
                                    <div class="modal-title text-center mb-3">
                                        <h5 class="mt-2 h5">Kirim ulang kode validasi</h5>
                                        <span>Silahkan masukkan email anda yang telah terdaftar untuk menerima kode verifikasi terbaru</span>
                                    </div>
                                    <form class="">
                                        <div class="form-row">
                                            <div class="col-md-12">
                                                <div class="position-relative form-group">
                                                    <input name="verificationEmail" id="verificationEmail" placeholder="email..." type="email" class="form-control" v-model="validation_email">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer clearfix">
                                    <div class="float-right">
                                        <button class="btn btn-primary btn-lg" @click="resendValidateEmail">Kirim Ulang</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-center text-white opacity-8 mt-3">Copyright © Maesa Holding {{new Date().getFullYear()}}</div>
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
import Api from "../../api";
import toastr from "toastr";
export default {
    name: "EmailValidation",
    data() {
        return {
            isLoading: false,
            isValidation: true,
            validation_code: null,
            validation_email: null
        }
    },
    methods: {
        validateEmail() {
            if (!this.validation_code) return null;
            this.$set(this,'isLoading',true);
            Api.auth.validate_email(this.validation_code).then((res)=>{
                this.clearForm();
                this.$set(this,'isLoading',false);
                toastr.options.progressBar = true;
                toastr.success(res.data.message, "Success");
                this.$router.push("/login");
            }).catch((err)=>{
                this.$set(this,'isLoading',false);
                toastr.options.progressBar = true;
                toastr.error(err.response.data.message ? err.response.data.message : err.response.data.exception.split('\\').pop(), "Error");
            })
        },
        resendValidateEmail() {
            if (!this.validation_email) return null;
            this.$set(this,'isLoading',true);
            Api.auth.resend_code({
                email:this.validation_email
            }).then((res)=>{
                this.clearForm();
                this.isValidation = true;
                this.$set(this,'isLoading',false);
                toastr.options.progressBar = true;
                toastr.success(res.data.message, "Success");
            }).catch((err)=>{
                this.$set(this,'isLoading',false);
                toastr.options.progressBar = true;
                toastr.error(err.response.data.message ? err.response.data.message : err.response.data.exception.split('\\').pop(), "Failed");
            })
        },
        clearForm() {
            this.validation_code = null;
            this.validation_email = null;
        }
    }
}
</script>

<style scoped>

</style>
