
IMask(document.getElementById('price'), {
    mask: 'num',
    blocks: {
        num: {
            // nested masks are available!
            mask: Number,
            thousandsSeparator: ',',
            max: 9999
        }
    }
});

//Initialize Select2 Elements
$('.select2').select2();

IMask(document.getElementById('discount'), {
    mask: 'num',
    blocks: {
        num: {
            // nested masks are available!
            mask: Number,
            thousandsSeparator: ',',
            max: 999
        }
    }
});

//Date range picker with time picker
$('#reservationtime').daterangepicker({
    timePicker: true,
    autoUpdateInput: false,
    timePicker24Hour: true,
    timePickerSeconds: true,
    minDate: moment().format('MM/DD/YYYY HH:mm:ss'),
    locale: {
        cancelLabel: 'Clear',
        format: 'MM/DD/YYYY hh:mm:ss'
    }
});

var startDate, endDate;

$('#reservationtime').on('apply.daterangepicker', function (ev, picker) {
    startDate = picker.startDate.format('MM/DD/YYYY HH:mm:ss');
    endDate = picker.endDate.format('MM/DD/YYYY HH:mm:ss');
    $(this).val(startDate + ' - ' + endDate);
});

$('#reservationtime').on('cancel.daterangepicker', function (ev, picker) {
    $(this).val('');
});

$('#btnAddColor').click(function () {
    addColor();
});
$('#colorName').keypress(function (e) {
    if (e.keyCode == 13) {
        addColor();
    }
});

$('#btnPublish').click(function (e) {
    var cate = $('#category').val().trim();
    if (cate == '') {
        toastr.error('Choose a category!');
        $('#category').focus();
        return false;
    }

    var brand = $('#brand').val().trim();
    if (brand == '') {
        toastr.error('Choose a brand!');
        $('#brand').focus();
        return false;
    }


    var name = $('#name').val().trim();
    if (name == '') {
        toastr.error('Enter the product name!');
        $('#name').focus();
        return false;
    }

    var price = $('#price').val().trim().replace(/,/g, '');
    if (price == '') {
        toastr.error('Enter the product price!');
        $('#price').focus();
        return false;
    }

    if (images.length == 0) {
        toastr.error('Upload a photo for product!');
        $('.image-chooser').addClass('error');
        setTimeout(function () {
            $('.image-chooser').removeClass('error');
        }, 1500);
        return false;
    }

    var thumb = $('input[name="thumb"]:checked').val();

    if (thumb == undefined) {
        toastr.error('Choose a image as avatar');
        return false;
    }

    specs = [];
    var invalid = false;
    $('.specs').each(function (i, item) {
        var attrId = $(item).attr('attr-id').trim();
        var attrName = $(item).attr('attr-name').trim();
        var value = $(item).val().trim();

        if (value === '') {
            toastr.error(`Enter the ${attrName} information for product!`);
            $('.nav-tabs li:eq(1) a').tab('show');
            setTimeout(function () {
                $(item).focus();
            }, 500);
            invalid = true;
            return false;
        }
        specs.push({
            attributeId: attrId,
            value: value
        });
    });

    if (invalid) {
        return invalid;
    }

    var discount = $('#discount').val().trim();
    if (discount != '') {
        if (startDate == null || endDate == null) {
            toastr.error(`Enter the promotion date range!`);
            $('.nav-tabs li:eq(2) a').tab('show');
            setTimeout(function () {
                $('#reservationtime').focus();
            }, 500);
            return false;
        }
    }

    $.post('../admin/create-product', {
        category: cate,
        brand: brand,
        name: name,
        price: price,
        thumb: thumb,
        specs: JSON.stringify(specs),
        images: JSON.stringify(images),
        discount: discount,
        startDate: startDate,
        endDate: endDate
    }, function (res) {
        if (res == 'successed') {
            Swal.fire({
                title: 'Product created',
                text: 'Do you want to redirect to the product list?',
                icon: 'success',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes',
                cancelButtonText: 'No',
                customClass: {
                    confirmButton: 'btn',
                    cancelButton: 'btn'

                }
            }).then((result) => {
                if (result.value) {
                    window.location.href = './product-list';
                } else {
                    window.location.reload();
                }
            });
        }
    });
});