(function ($) {
    $.extend($, {
        procAjaxData: function (data, funcSuc, funcErr) {
            if (!data.Statu) {
                return;
            }
            switch (data.Statu)
            {
                case "ok":
                    alert("OK:" + data.Msg);
                    if (funcSuc) {
                        funcSuc(data);
                    }
                    break;
                case "error":
                    alert("ERROR:" + data.Msg);
                    if (funcErr) {
                        funcErr(data);
                    }
                    break;
                default:

            }
        }
                

    })

}(jQuery))