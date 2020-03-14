var images = [];
var specs = [];

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

var $galleryContainer = $('.gallery-container');

function uploadImage(el) {
    var fd = new FormData();
    var files = $(el)[0].files;
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
                $galleryContainer.find('.image-chooser').remove();
                data.forEach(function (item, i) {
                    $galleryContainer.append(
                        `<div class="image-preview col-md-3">
                            <span class="close" title="Remove" onclick="removeImage(this, '${item}')">×</span>
                            <div class="image" style="background-image:url(../uploads?fileName=${item})">
                                <input hidden type="text" name="images" value="${item}"/>
                            </div>
                            <div class="text-center radio-avt">
                                <div class="custom-control custom-radio">
                                    <input class="custom-control-input" type="radio" id="radio${item}" name="thumb" value="${item}">
                                    <label for="radio${item}" class="custom-control-label">Avatar</label>
                                </div>
                            </div>
                        </div>`);
                    images.push(item);
                });

                $galleryContainer.append(`
                        <label class="image-chooser col-md-3">
                            <input type="file" accept="image/png,image/jpeg"
                                   multiple="true" style="display: none" onchange="uploadImage(this)"/>
                        </label>`);

            } catch (e) {

            }
        }
    });
}

function removeImage(el, image) {
    images.map(function (item, i) {
        if (item == image) {
            images.splice(i, 1);
        }
    });
    $(el).parent().remove();
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

$('.data-table').on('length.dt', function (e, settings, len) {
    localStorage.setItem('pageLength', len);
    
});
const pageLength = localStorage.getItem('pageLength');

const dataTableOptions = {
    "paging": true,
    "lengthChange": true,
    "searching": true,
    "ordering": true,
    "info": true,
    "autoWidth": false,
    "language": {
        "search": "<i class='fa fa-search text-gray'></i>",
        "paginate": {
            "next": "<i class='fa fa-chevron-right'></i>",
            "previous": "<i class='fa fa-chevron-left'></i>"
        },
    },
    "pageLength": pageLength != null ? pageLength : 25
};
