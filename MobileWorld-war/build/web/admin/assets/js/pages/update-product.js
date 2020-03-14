var colors = [];
var images = [];
var colorSelected;
var specs = [];

function removeColor(el, color) {
    colors.map(function (item, i) {
        if (item.hexCode == color) {
            colors.splice(i, 1);
        }
    });
    $(el).remove();
}

function removeImage(el, image) {
    images.map(function (item, i) {
        if (item == image) {
            images.splice(i, 1);
        }
    });
    $(el).remove();
}

function renderSpecificationForm() {
    var cateSelected = $('#category').val();
    var html = "";
    attributeList.forEach(function (item) {
        if (item[2] == cateSelected) {
            html += `<div class="col-md-6">
                        <div class="form-group">
                            <label>${item[1]}</label>
                            <input type="text" class="form-control specs" attr-id="${item[0]}" attr-name="${item[1]}" />
                        </div>
                    </div>`;
        }
    });

    $('#specifications').html(html);
}

function addColor() {
    if (colors.length >= 10) {
        toastr.error('You can not add more than 10 colors!');
        return false;
    }

    var colorName = $('#colorName').val().trim();

    if (!colorSelected) {
        toastr.error('Please pick a color!');
        return false;
    }

    if (!colorName) {
        toastr.error('Please enter a color name');
        return false;
    }

    var found = colors.find(function (c) {
        return c.hexCode == colorSelected;
    });

    if (found) {
        toastr.error('This color has been selected!');
        return false;
    }

    var color = {
        hexCode: colorSelected,
        name: colorName
    };

    colors.push(color);
    var html = `<div class="callout py-1" style="border-left: 10px solid ${colorSelected}; border-bottom: 1px solid ${colorSelected}" 
                    onclick="removeColor(this, '${colorSelected}')" title="Click to remove">
                    <button type="button" class="close">×</button>        
                    <h5>${colorName}</h5>
                </div>`;
    $('#colorContainer').append(html);
    $('#colorName').val('');

}

clrList.forEach(function (item) {
    var color = {
        hexCode: item.hexCode,
        name: item.name
    };

    colors.push(color);
    var html = `<div class="callout py-1" style="border-left: 10px solid ${item.hexCode}; border-bottom: 1px solid ${item.hexCode}" 
                    onclick="removeColor(this, '${item.hexCode}')" title="Click to remove">
                    <button type="button" class="close">×</button>        
                    <h5>${item.name}</h5>
                </div>`;
    $('#colorContainer').append(html);
    $('#colorName').val('');
});

imgList.forEach(function (item) {
    $('.gallery-container .content').append(
            `<div class="image-preview" onclick="removeImage(this, '${item}')" title="Click to remove">
                                <span class="close">×</span>
                                <div class="image" style="background-image:url(../uploads/${item})">
                                    <input hidden type="text" name="images" value="${item}"/>
                                </div>
                            </div>`);
    images.push(item);
});

if (specList.length > 0) {
    specList.forEach(function (item) {
        $('#specifications').append(
                `<div class="col-md-6">
                <div class="form-group">
                    <label>${item.attrName}</label>
                    <input type="text" class="form-control specs" attr-id="${item.attrId}" attr-name="${item.attrName}" value="${item.value}" />
                </div>
            </div>`);
    });
} else {
    renderSpecificationForm();
}

$('#category').change(function () {
    renderSpecificationForm();
});

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

$('#category').change(function () {
    renderSpecificationForm();
});

var colorPicker = new iro.ColorPicker("#color-picker", {
    // Set the size of the color picker
    width: 200,
    // Set the initial color to pure red
    color: "#fff"
}).on('color:change', function (color) {
    colorSelected = color.hexString;
    $('#colorPreview').css('background-color', color.hexString);
    $('#colorName').val('');
    $('#colorName').focus();
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
    timePicker24Hour: true,
    timePickerSeconds: true,
    autoUpdateInput: false,
    locale: {
        cancelLabel: 'Clear',
        format: 'MM/DD/YYYY hh:mm:ss'
    }
});

if (startDate != '' && endDate != '') {
    $('#reservationtime').data('daterangepicker').setStartDate(startDate);
    $('#reservationtime').data('daterangepicker').setEndDate(endDate);

    $('#reservationtime').val(startDate + ' - ' + endDate);
}

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


$('.scrollPane').overlayScrollbars({
    sizeAutoCapable: true,
    overflowBehavior: {
        x: "h",
        y: "scroll"
    },
    scrollbars: {
        visibility: "auto",
        autoHide: "l",
        autoHideDelay: 500,
        dragScrolling: true,
        clickScrolling: false,
        touchSupport: true,
        snapHandle: false
    }
});

$('#galleryScrollPane').overlayScrollbars({
    sizeAutoCapable: true,
    overflowBehavior: {
        x: "scroll",
        y: "scroll"
    },
    scrollbars: {
        visibility: "auto",
        autoHide: "l",
        autoHideDelay: 500,
        dragScrolling: true,
        clickScrolling: false,
        touchSupport: true,
        snapHandle: false
    }
});

$('#galleryScrollPane input').change(function () {
    var fd = new FormData();
    var files = $(this)[0].files;
    for (var i = 0; i < files.length; i++) {
        fd.append('files', files[i]);
    }


    $.ajax({
        url: '../upload',
        data: fd,
        cache: false,
        processData: false,
        contentType: false,
        type: 'POST',
        success: function (data) {

            try {
                data = JSON.parse(data);
                data.forEach(function (item, i) {
                    $('.gallery-container .content').append(
                            `<div class="image-preview" onclick="removeImage(this, '${item}')" title="Click to remove">
                                <span class="close">×</span>
                                <div class="image" style="background-image:url(../uploads/${item})">
                                    <input hidden type="text" name="images" value="${item}"/>
                                </div>
                            </div>`);
                    images.push(item);
                });
            } catch (e) {

            }
        }
    });
});

$('#btnUpdate').click(function (e) {

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

    if (colors.length == 0) {
        toastr.error('Pick a color for product!');
        $('#colorName').focus();
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

    var category = $('#category').val().trim();
    var brand = $('#brand').val().trim();

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

    $.post('../admin/update-product', {
        id: id,
        category: category,
        brand: brand,
        name: name,
        price: price,
        colors: JSON.stringify(colors),
        specs: JSON.stringify(specs),
        images: JSON.stringify(images),
        discount: discount,
        startDate: startDate,
        endDate: endDate
    }, function (res) {
        if (res == 'successed') {
            Swal.fire({
                title: 'Product updated',
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