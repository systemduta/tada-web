const path = {
    base: '',
    header: {
        content_type: 'application/json',
        accept: 'application/json'
    },
    auth: {
        login: '/user/login',
        logout: '/logout',
        register: '/merchant/register',
        validate: '/user/validate_email/{code}',
        resend_code: '/user/resend_email_code'
    },
    company: {
        base: '/companies',
        detail: '/companies/{id}',
        join: '/companies/join'
    },
    customer: {
        base: '/customers',
        detail: '/customers/{id}'
    },
    merchant_category: {
        base: '/merchant_category',
        detail: '/merchant_category/{id}'
    },
    notification: {
        base: '/notifications'
    },
    user: {
        base: '/users',
        detail: '/users/{id}',
        memberElse: '/users/profile/{username}',
        avatar: '/users/profile/member/updatePhotoProfile'
    }
};

export default path;
