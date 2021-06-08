import axios from "axios";
import Path from './path';

// axios.defaults.baseURL = 'https://api.maesagroup.co.id/api';
axios.defaults.baseURL = '/api';
axios.defaults.headers.post['Content-Type'] = Path.header.content_type;
axios.defaults.headers.post['Accept'] = Path.header.accept;

const api = {
    auth: {
        login: (data) => {
            return axios.post(Path.auth.login, data);
        },
        logout: () => {
            return axios.get(Path.auth.logout)
        },
        register: (data) => {
            return axios.post(Path.auth.register, data)
        },
        validate_email: (code) => {
            return axios.get(Path.auth.validate.replace('{code}', code));
        },
        resend_code: (data) => {
            return axios.post(Path.auth.resend_code, data);
        },
    },
    voucher: {
        index: (params) => {
            return axios.get(Path.voucher.base, {
                params: params
            });
        },
        show: (id, params) => {
            return axios.get(Path.voucher.detail.replace('{id}', id), {
                params: params
            });
        },
        store: (data) => {
            return axios.post(Path.voucher.base, data);
        },
        update: (id,data) => {
            return axios.post(Path.voucher.detail.replace('{id}', id), data);
        },
        destroy: (id) => {
            return axios.delete(Path.voucher.detail.replace('{id}', id))
        },
    },
    customer: {
        index: (params) => {
            return axios.get(Path.customer.base, {
                params: params
            });
        },
        show: (id, params) => {
            return axios.get(Path.customer.detail.replace('{id}', id), {
                params: params
            });
        },
        store: (data) => {
            return axios.post(Path.customer.base, data);
        },
        update: (id,data) => {
            return axios.post(Path.customer.detail.replace('{id}', id), data);
        },
        destroy: (id) => {
            return axios.delete(Path.customer.detail.replace('{id}', id))
        }
    },
    merchant_category: {
        index: (params) => {
            return axios.get(Path.merchant_category.base, {
                params: params
            });
        },
        show: (id, params) => {
            return axios.get(Path.merchant_category.detail.replace('{id}', id), {
                params: params
            });
        },
        store: (data) => {
            return axios.post(Path.merchant_category.base, data);
        },
        update: (id,data) => {
            return axios.post(Path.merchant_category.detail.replace('{id}', id), data);
        },
        destroy: (id) => {
            return axios.delete(Path.merchant_category.detail.replace('{id}', id))
        }
    },
    notification: {
        index: (params) => {
            return axios.get(Path.notification.base, {
                params: params
            });
        }
    },
    user: {
        index: (params) => {
            return axios.get(Path.user.base, {
                params: params
            });
        },
        show: (id, params) => {
            return axios.get(Path.user.detail.replace('{id}', id), {
                params: params
            });
        },
        store: (data) => {
            return axios.post(Path.user.base, data);
        },
        update: (id,data) => {
            return axios.put(Path.user.detail.replace('{id}', id), data);
        },
        destroy: (id) => {
            return axios.delete(Path.user.detail.replace('{id}', id))
        },
        detailElse: (user) => {
            return axios.get(Path.user.memberElse.replace('{username}', user))
        },
        editProfile: (data) => {
            return axios.put(Path.user.member, data)
        },
        editAvatar: (image) => {
            return axios.post(Path.user.avatar, image)
        }
    }
};

export default api;
