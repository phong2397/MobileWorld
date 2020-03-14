jQuery(function () {
    $('#btnSignOut').click(function () {
        Swal.fire({
            title: 'Are you sure to sign out?',
            confirmButtonText: 'Yes, Sign out now!',
            customClass: {
                confirmButton: 'btn btn-danger',
            },
            buttonsStyling: false
        }).then(function (result) {
            if (result.value) {
                window.location.href = "./sign-out";
            }
        });
    });
    
    
});