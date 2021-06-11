<template>
    <div class="app-sidebar sidebar-shadow sidebar-custom">
        <div class="scrollbar-sidebar">
            <div class="app-sidebar__inner">
                <ul class="vertical-nav-menu">
                    <li class="app-sidebar__heading">General</li>
                    <li>
                        <router-link :to="{ name: 'dashboard'}" :class="{ 'mm-active': isActive('dashboard') }">
                            <i class="metismenu-icon pe-7s-rocket"></i> Dashboard
                        </router-link>
                    </li>
                    <li>
                        <router-link :to="{ name: 'indexVoucher'}" :class="{ 'mm-active': isActive('indexVoucher') }">
                            <i class="metismenu-icon pe-7s-cash"></i> Voucher
                        </router-link>
                    </li>
                    <li>
                        <router-link :to="{ name: 'createTransaction'}" :class="{ 'mm-active': isActive('createTransaction') }">
                            <i class="metismenu-icon pe-7s-loop"></i> Transaction
                        </router-link>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "Sidebar",
    methods: {
        isActive(menuItem) {
            return this.$route.name === menuItem;
        }
    }
}
</script>

<style scoped>
    .sidebar-custom {
        width: 280px;
    }

</style>
