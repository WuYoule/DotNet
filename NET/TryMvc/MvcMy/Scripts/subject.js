$(function () {
    Init(1);

});

function Init(page) {

    var rows = $("#rows").val();
    SearchCondition(rows, page);
}
function pagesizeChange() {

    var rows = $("#rows").val();

    SearchCondition(rows, 1);
}
function SearchCondition(rows, page) {

    url = "/Index/GetSchoolData?page=" + page + "&rows=" + rows;
    $.post(url, function (data) {

        $("#totalcount").html(data.total);
        $("#pagecount").html(Math.ceil(data.total / rows));
        $("#tablebody").html("");
        var tr = "";
        $.each(data.rows, function (i, item) {

            tr += "<tr><td><input name='checkbox' type='checkbox' value='" + item.SCHOOL_ID + "' ></td>";
            tr += "<td>" + item.SCHOOL_NAME + "</td>";
            tr += "<td>" + item.SCHOOL_N + "</td>";
            if (item.SCHOOL_TYPE == "1") {
                tr += "<td>幼儿园</td>";
            }
            else if (item.SCHOOL_TYPE == "2") {
                tr += "<td>小学</td>";
            }
            else if (item.SCHOOL_TYPE == "3") {
                tr += "<td>初中</td>";
            }
            else {
                tr += "<td>高中</td>";
            }
            tr += "<td>" + item.SCHOOL_AREA + "</td>";
            tr += "<td style='width:110px;'><button onclick='edit(" + item.SCHOOL_ID + ")' type='button' class='btn btn-primary btn-xs'><i class='fa fa-pencil' ></i>修改</button>  <button  type='button' onclick='del(" + item.SCHOOL_ID + ")' class='btn btn-primary btn-xs'><i class='fa fa-times' ></i>删除</button></td>";
        });
        $("#tablebody").html(tr);
        var element = $("#grid_paging");
        if (data.total > 0) {
            var options = {
                bootstrapMajorVersion: 3,
                currentPage: page,
                numberOfPages: rows,
                totalPages: Math.ceil(data.total / rows),

                onPageClicked: function (e, originalEvent, type, page) {
                    SearchCondition(rows, page);
                }
            };
            element.bootstrapPaginator(options);
        }
        else {
            element.html("");

        }

    });



}
function pagesizeChange() {
    var rows = $("#rows").val();
    SearchCondition(rows, 1);
}
var ids = "";
function moreDel() {
    var str = "";

    $("input[name='checkbox']:checked").each(function () {
       
        str += $(this).val() + ","
       
    })
    if (str==""||str==undefined) {
        $("#myModalBatchDelWarn").modal('show');
    }
    else {
        var s = str.substring(0, str.length - 1);
        ids = s;
        $("#myModalBatchDel").modal('show');
    }
            
    
}

function saveBatchDel() {

    $.post('/Index/moreDelSchool', { moreid: ids }, function (data) {
        if (data == "Y") {
            $("#myModalBatchDel").modal('hide');
            Init(1);
        }
    });
}
function del(id) {
    $("#schoolId_del").val(id);
    $("#myModalDel").modal('show');

}
    function saveDel() {
        var id = $("#schoolId_del").val();
        $.post('/Index/delSchool', { id: id }, function (data) {
            if (data == "Y") {
                Init(1);
            }
        });
    }

    function add() {
        $("#myModal").modal('show');
    }
    function saveAdd() {

        if (isNullOrUndefinedSoOn($('#schoolname').val())) {
            $('#schoolname').popover({
                placement: 'bottom',
                content: '不能为空！'
            });
            $("#schoolname").popover('show');
        }
        else {
            $("#schoolname").popover('hide');

            if (isNullOrUndefinedSoOn($('#schooln').val())) {
                $('#schooln').popover({
                    placement: 'bottom',
                    content: '不能为空！'
                });
                $("#schooln").popover('show');
            }
            else {
                $("#schooln").popover('hide');
                if (isNullOrUndefinedSoOn($('#schoolarea').val())) {

                    $('#schoolarea').popover({
                        placement: 'bottom',
                        content: '不能为空！'
                    });
                    $("#schoolarea").popover('show');
                }
                else {
                    $("#schoolarea").popover('hide');
                    var postdata = $("input,select").serializeArray();
                    $.post('/Index/AddSchool', postdata, function (data) {
                        if (data == "Y") {
                            $("#myModal").modal('hide');
                            Init(1);
                        }
                    });
                }
            }
        }

    }

    function edit(id) {

        $.post('/Index/editSchoolBefore', { schoolId: id }, function (data) {

            $('#schoolId_edit').val(data.SCHOOL_ID);
            $("#schoolname_edit").val(data.SCHOOL_NAME);
            $("#schooln_edit").val(data.SCHOOL_N);
            var type = data.SCHOOL_TYPE;
            if (type == "1") {
                $("#schooltype_edit").val("1");
            }
            else if (type == "2") {
                $("#schooltype_edit").val("2");
            }
            else if (type == "3") {
                $("#schooltype_edit").val("3");
            }
            else {
                $("#schooltype_edit").val("4");
            }
            $("#schoolarea_edit").val(data.SCHOOL_AREA);

            $("#myModalEdit").modal('show');
            $("#schoolname_edit").popover('hide');
            $("#schooln_edit").popover('hide');
            $("#schoolarea_edit").popover('hide');
        });

    }
    function isNullOrUndefinedSoOn(data) {
        if (data == null || data == "" || data == undefined) {
            return true;
        }
        else {
            return false;
        }

    }

    function saveEdit() {



        if (isNullOrUndefinedSoOn($('#schoolname_edit').val())) {
            $('#schoolname_edit').popover({
                placement: 'bottom',
                content: '不能为空！'
            });
            $("#schoolname_edit").popover('show');
        }
        else {
            $("#schoolname_edit").popover('hide');

            if (isNullOrUndefinedSoOn($('#schooln_edit').val())) {
                $('#schooln_edit').popover({
                    placement: 'bottom',
                    content: '不能为空！'
                });
                $("#schooln_edit").popover('show');
            }
            else {
                $("#schooln_edit").popover('hide');
                if (isNullOrUndefinedSoOn($('#schoolarea_edit').val())) {

                    $('#schoolarea_edit').popover({
                        placement: 'bottom',
                        content: '不能为空！'
                    });
                    $("#schoolarea_edit").popover('show');
                }
                else {
                    $("#schoolarea_edit").popover('hide');
                    var postdata = $("input,select").serializeArray();

                    $.post('/Index/editSchool', postdata, function (data) {
                        if (data == 'Y') {
                            $("#myModalEdit").modal('hide');
                            Init(1);
                        }

                    })
                }
            }
        }

    }
    function hidePopForName() {
        $("#schoolname_edit").popover('hide');
    }
    function hidePopForN() {

        $("#schooln_edit").popover('hide');
    }
    function hidePopForArea() {
        $("#schoolarea_edit").popover('hide');
    }

