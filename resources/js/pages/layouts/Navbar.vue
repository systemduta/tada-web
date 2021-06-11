<template>
    <div class="app-header header-shadow">
<!--        <div class="app-header__logo">-->
<!--            <h4>Maesa</h4>-->
<!--            <div class="app-header__mobile-menu">-->
<!--            </div>-->
<!--        </div>-->
        <div class="app-header__logo">
<!--            <div class="logo-src"></div>-->
            <h4>Maesa Reward</h4>
            <div class="header__pane ml-auto">
                <div>
                    <button type="button" class="hamburger close-sidebar-btn hamburger--elastic" data-class="closed-sidebar">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                    </button>
                </div>
            </div>
        </div>
        <div class="app-header__mobile-menu">
            <div>
                <button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
                        <span class="hamburger-box">
                            <span class="hamburger-inner"></span>
                        </span>
                </button>
            </div>
        </div>
        <div class="app-header__menu">
                <span>
                    <button type="button" class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
                        <span class="btn-icon-wrapper">
                            <i class="fa fa-ellipsis-v fa-w-6"></i>
                        </span>
                    </button>
                </span>
        </div>
        <div class="app-header__content">
            <div class="app-header-left">
            </div>
            <div class="app-header-right">
                <div class="header-btn-lg pr-0">
                    <div class="widget-content p-0">
                        <div class="widget-content-wrapper">
                            <div class="widget-heading mr-3">
                                <h5 style="margin-bottom: 0; font-weight: bold;">Bella</h5>
                                <div>Admin Merchant</div>
                            </div>
                            <div class="widget-subheading">
                                <a href="javascript:void(0)" @click="logout">
                                    <i class="metismenu-icon pe-7s-less" style="font-size: 30px;"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "Navbar",
    methods: {
        logout() {
            this.$store.dispatch('logout').then(() => {
                this.$router.push("/login")
            });
        },
    }
}
</script>

<style scoped>

</style>
