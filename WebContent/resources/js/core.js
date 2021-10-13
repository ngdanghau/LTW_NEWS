$(function() {
    TimesWriter.AjaxForms();
    TimesWriter.CheckAll();

    TimesWriter.RemoveListItem();
    TimesWriter.RestoreListItem();
});


/**
 * TimesWriter Namespace
 */
var TimesWriter = {};

TimesWriter.CheckAll = function(){
    $("body").on("click", "#checkall", function(){
        var isCheck = $(this).is(":checked");
        document.getElementsByName('delete_items[]').forEach(item => item.checked = isCheck);
    });
}


TimesWriter.UrlSlug = function(){
    $("body").on("input propertychange keyup", ".slug_title", function(){
        var slug_title = $(this).val();
        var slug_url = $(".slug_url");
        if(slug_url.val() == ""){
            slug_url.val(ChangeToSlug(slug_title));
        }
    });
}


/**
 * Ajax forms
 */
TimesWriter.AjaxForms = function()
{   
    var $form;

    $("body").on("submit", ".js-ajax-form", function(){
        $form = $(this);
        submitable = true;

        if (submitable) {
            $form.parents(".main-content").addClass('block-mode-loading');

            $.ajax({
                url: $form.attr("action"),
                type: $form.attr("method"),
                dataType: 'jsonp',
                data: $form.serialize(),
                error: function() {
                    $form.parents(".main-content").removeClass("block-mode-loading");
                    Swal.fire('Oops...', "Oops! Đã xảy ra lỗi. Vui lòng thử lại sau!", 'error')
                },
                success: function(resp) {
                    if (typeof resp.redirect === "string") {
                        window.location.href = resp.redirect;
                    } else if (typeof resp.msg === "string") {
                        var result = resp.result || 0;
                        var reset = resp.reset || 0;
                        switch (result) {
                            case 1: // 
                                Swal.fire('Thành Công', resp.msg, 'success')
                                if (reset) {
                                    $form[0].reset();
                                }
                                break;

                            case 2: // 
                                Swal.fire('Thông Báo', resp.msg, 'info')
                                break;

                            default:
                                Swal.fire( 'Oops...', resp.msg, 'error')
                                break;
                        }
                        $form.parents(".main-content").removeClass("block-mode-loading");
                    } else {
                        $form.parents(".main-content").removeClass("block-mode-loading");
                        Swal.fire('Oops...', "Oops! Đã xảy ra lỗi. Vui lòng thử lại sau!", 'error')
                    }
                    if( typeof resp.target === "string") {
                        if(resp.append){
                            $(resp.target).append(resp.data)
                        }else if(resp.prepend){
                            $(resp.target).prepend(resp.data)
                        }else if(resp.after){
                            $(resp.target).after(resp.data)
                        }else if(resp.before){
                            $(resp.target).before(resp.data)
                        }
                    } 
                }
            });
        } else {
            Swal.fire('Oops...', "Điền đầy đủ các trường!", 'error');
        }

        return false;
    });
}

/**
 * Remove List Item (Data entry)
 * 
 * Sends remove request to the backend 
 * for selected list item (data entry)
 */
TimesWriter.RemoveListItem = function()
{
    $("body").on("click", ".js-remove-list-item", function() {
        var ids = [$(this).data("id")];
        ids = ids.filter(Boolean);
        if(ids.length == 0) document.querySelectorAll('input[name="delete_items[]"]:checked').forEach(item => ids.push(item.value));
        if(ids.length == 0){
            Swal.fire('Oops...', "Thiếu danh sách ID", 'error');
            return;
        }
        var trash = $(this).data("trash");
        var url = $(this).data("url");
        $form = $(this).parents(".main-content");
        Swal.fire({
            title: "Bạn có chắc không?",
            text: "Không thể lấy lại dữ liệu đã bị xóa!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: "Có, Xoá",
            cancelButtonText: "Huỷ"
        }).then((result) => {
            if (result.value) {
                $form.addClass('block-mode-loading');
                $.ajax({
                    url: url,
                    type: 'POST',
                    dataType: 'jsonp',
                    data: {
                        action: "remove",
                        ids: ids,
                        trash: trash
                    },
                    error: function() {
                        $form.removeClass('block-mode-loading');
                        Swal.fire('Oops...', "Oops! Đã xảy ra lỗi. Vui lòng thử lại sau!", 'error')
                    },
                    success: function(resp) {
                        $form.removeClass('block-mode-loading');
                        if(resp.result == 0){
                            Swal.fire('Oops...', resp.msg, 'error')
                        }else if(resp.reload){
                            window.location.reload()
                        }else{
                            window.location.href = resp.redirect;
                        }
                        
                    }
                });
            }
        });
    });
}

TimesWriter.RestoreListItem = function()
{
    $("body").on("click", ".js-restore-list-item", function() {
        var ids = [$(this).data("id")];
        ids = ids.filter(Boolean);
        if(ids.length == 0) document.querySelectorAll('input[name="delete_items[]"]:checked').forEach(item => ids.push(item.value));
        if(ids.length == 0){
            Swal.fire('Oops...', "Thiếu danh sách ID", 'error');
            return;
        }
        var url = $(this).data("url");
        $form = $(this).parents(".main-content");
        $form.addClass('block-mode-loading');
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'jsonp',
            data: {
                action: "restore",
                ids: ids
            },
            error: function() {
                $form.removeClass('block-mode-loading');
                Swal.fire('Oops...', "Oops! Đã xảy ra lỗi. Vui lòng thử lại sau!", 'error')
            },
            success: function(resp) {
                $form.removeClass('block-mode-loading');
                if(resp.result == 0){
                    Swal.fire('Oops...', resp.msg, 'error')
                }else if(resp.reload){
                    window.location.reload()
                }else{
                    window.location.href = resp.redirect;
                }
                
            }
        });
    });
}

function getFlatArray(serialized, list, parent){
    for(var i = 0;i < list.length;i++){
        var id = list.eq(i).children().eq(0).find("input[name='id']").val();
        serialized.push({
            id: id,
            title: list.eq(i).children().eq(0).find("input[name='title']").val(),
            target: list.eq(i).children().eq(0).find("input[name='target']").val(),
            parent: parent
        });
        if(list.eq(i).children().eq(1).children().eq(0).children().length > 0){
            serialized = getFlatArray(serialized, list.eq(i).children().eq(1).children().eq(0).children(), id); 
        }
    }
    return serialized;
}

/**
 * Menu
 */
TimesWriter.Menu = function()
{
    $("body").on("click", ".btn-save-menu", function(){
        var url = $(this).data("url");
        $form = $(this).parents(".main-list");

        var serialized = [];
        var list = $("#project-list-left").children();
        
        serialized = getFlatArray(serialized, list, 0);
        $form.addClass('block-mode-loading');
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'jsonp',
            data: {
                action: "update",
                items: JSON.stringify(serialized)
            },
            error: function() {
                $form.removeClass('block-mode-loading');
                Swal.fire('Oops...', "Oops! Đã xảy ra lỗi. Vui lòng thử lại sau!", 'error')
            },
            success: function(resp) {
                $form.removeClass('block-mode-loading');
                if(resp.result == 0){
                    Swal.fire('Oops...', resp.msg, 'error')
                }else{
                    Swal.fire('Thành Công', resp.msg, 'success')
                }
                
            }
        });
    });

    $("body").on("click", ".btn-delete-item", function(){
        var item = $(this).parents(".accordion");
        var url = $(this).data("url");
        var id = $(this).data("id");
        $form = $(this).parents(".main-list");
        $form.addClass('block-mode-loading');
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'jsonp',
            data: {
                action: "remove",
                id: id
            },
            error: function() {
                $form.removeClass('block-mode-loading');
                Swal.fire('Oops...', "Oops! Đã xảy ra lỗi. Vui lòng thử lại sau!", 'error')
            },
            success: function(resp) {
                $form.removeClass('block-mode-loading');
                if(resp.result == 0){
                    Swal.fire('Oops...', resp.msg, 'error')
                }else{
                    item.fadeOut(500, function() {
                        item.remove();
                    });
                }
                
            }
        });
    });
}

/**
 * Widget
 */
 TimesWriter.Widget = function()
 {
     $("body").on("click", ".btn-save-widget", function(){
         var items = [];
         var titles = document.querySelectorAll('input[name="title[]"]');
         var ids = document.querySelectorAll('input[name="id[]"]');
         var layouts = document.querySelectorAll('select[name="layout[]"]');
         var cat_ids = document.querySelectorAll('select[name="cat_id[]"]');
         var url = $(this).data("url");
 
         $form = $(this).parents(".main-list");
 
         for (let i = 0; i < titles.length; i++) {
             items.push({
                 id: ids[i].value,
                 layout: layouts[i].value,
                 title: titles[i].value,
                 cat_id: cat_ids[i].value,
                 order_widget: i
             })
         }
         $form.addClass('block-mode-loading');
         $.ajax({
             url: url,
             type: 'POST',
             dataType: 'jsonp',
             data: {
                 action: "update",
                 items: JSON.stringify(items)
             },
             error: function() {
                 $form.removeClass('block-mode-loading');
                 Swal.fire('Oops...', "Oops! Đã xảy ra lỗi. Vui lòng thử lại sau!", 'error')
             },
             success: function(resp) {
                 $form.removeClass('block-mode-loading');
                 if(resp.result == 0){
                     Swal.fire('Oops...', resp.msg, 'error')
                 }else{
                     Swal.fire('Thành Công', resp.msg, 'success')
                 }
                 
             }
         });
     });
 
     $("body").on("click", ".btn-delete-item", function(){
         var item = $(this).parents(".accordion");
         var url = $(this).data("url");
         var id = $(this).data("id");
         $form = $(this).parents(".main-list");
         $form.addClass('block-mode-loading');
         $.ajax({
             url: url,
             type: 'POST',
             dataType: 'jsonp',
             data: {
                 action: "remove",
                 id: id
             },
             error: function() {
                 $form.removeClass('block-mode-loading');
                 Swal.fire('Oops...', "Oops! Đã xảy ra lỗi. Vui lòng thử lại sau!", 'error')
             },
             success: function(resp) {
                 $form.removeClass('block-mode-loading');
                 if(resp.result == 0){
                     Swal.fire('Oops...', resp.msg, 'error')
                 }else{
                     item.fadeOut(500, function() {
                         item.remove();
                     });
                 }
                 
             }
         });
     });
 }

 TimesWriter.Featured = function () {
    $(".btn-featured").on("click", function() {
        var $this = $(this);
        $form = $this.parents(".main-content");
        $form.addClass('block-mode-loading');
        var url = $this.data("url");
        var id = $this.data("id");

        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'jsonp',
            data: {
                action: 'featured',
                id: id,
            },

            error: function() {
                $form.removeClass('block-mode-loading');
                Swal.fire('Oops...', "Oops! Đã xảy ra lỗi. Vui lòng thử lại sau!", 'error')
            },

            success: function(resp) {
                $form.removeClass('block-mode-loading');
                 if(resp.result == 0){
                     Swal.fire('Oops...', resp.msg, 'error')
                 }else{
                    $this.html(resp.html);
                 }
            }
        });
    });
 }

 TimesWriter.Media = function()
 {
    CKFinder.widget( 'ckfinder-widget', {
        width: '100%',
        height: 700,
    } );
 }

 TimesWriter.RecoveryPassword = function()
 {
    $("body").on("click", ".js-recovery-password", function() {
        var id = $(this).data("id");
        var url = $(this).data("url");
        $form = $(this).parents(".main-content");
        $form.addClass('block-mode-loading');
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'jsonp',
            data: {
                action: "recovery",
                id: id,
            },
            error: function() {
                $form.removeClass('block-mode-loading');
                Swal.fire('Oops...', "Oops! Đã xảy ra lỗi. Vui lòng thử lại sau!", 'error')
            },
            success: function(resp) {
                $form.removeClass('block-mode-loading');
                if(resp.result == 0){
                    Swal.fire('Oops...', resp.msg, 'error')
                }else if(resp.reload){
                    window.location.reload()
                }else if(resp.redirect){
                    window.location.href = resp.redirect;
                }else{
                    Swal.fire('Thành Công', resp.msg, 'success')
                }
                
            }
        });
    });
 }

 TimesWriter.Approve = function()
 {
    $("body").on("click", ".js-approve-list-item", function() {
        var ids = [$(this).data("id")];
        ids = ids.filter(Boolean);
        if(ids.length == 0) document.querySelectorAll('input[name="delete_items[]"]:checked').forEach(item => ids.push(item.value));
        if(ids.length == 0){
            Swal.fire('Oops...', "Thiếu danh sách ID", 'error');
            return;
        }
        var approve = $(this).data("approve");
        var url = $(this).data("url");
        $form = $(this).parents(".main-content");
        $form.addClass('block-mode-loading');
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'jsonp',
            data: {
                action: "approve",
                ids: ids,
                approve: approve
            },
            error: function() {
                $form.removeClass('block-mode-loading');
                Swal.fire('Oops...', "Oops! Đã xảy ra lỗi. Vui lòng thử lại sau!", 'error')
            },
            success: function(resp) {
                $form.removeClass('block-mode-loading');
                if(resp.result == 0){
                    Swal.fire('Oops...', resp.msg, 'error')
                }else if(resp.reload){
                    window.location.reload()
                }else{
                    window.location.href = resp.redirect;
                }
                
            }
        });
    });
 }
/**
 * Profile
 */
TimesWriter.Profile = function()
{
    $(".dastone-profile_main-pic-change").on("click",function(){
        var $this = $(this);
        $form = $this.parents(".main-content");
        var url = $this.data("url");

        CKFinder.modal( {
            chooseFiles: true,
            width: 800,
            height: 600,
            onInit: function( finder ) {
                finder.on( 'files:choose', function( evt ) {
                    var file = evt.data.files.first();
                    $form.addClass('block-mode-loading');
                    $.ajax({
                        url: url,
                        type: 'POST',
                        dataType: 'jsonp',
                        data: {
                            action: 'avatar',
                            file: file.getUrl()
                        },
            
                        error: function() {
                            $form.removeClass('block-mode-loading');
                            Swal.fire('Oops...', "Oops! Đã xảy ra lỗi. Vui lòng thử lại sau!", 'error')
                        },
            
                        success: function(resp) {
                            $form.removeClass('block-mode-loading');
                            if(resp.result == 0){
                                Swal.fire('Oops...', resp.msg, 'error')
                            }else{
                                $("#avatar").attr("src", file.getUrl());
                            }
                        }
                    });
                } );
            }
        } );
    })

    // $(".js-resend-verification-email").on("click", function() {
    //     var $this = $(this);
    //     var $alert = $this.parents(".alert");

    //     if ($alert.hasClass("onprogress")) {
    //         return;
    //     }

    //     $alert.addClass('onprogress');
        
    // });
}


/**
 * LogoType
 */
 TimesWriter.LogoType = function()
{
    $(".logotype").on("click",function(){
        CKFinder.modal({
            chooseFiles: true,
            width: 800,
            height: 600,
            onInit: function( finder ) {
                finder.on( 'files:choose', function( evt ) {
                    var file = evt.data.files.first();
                    $("#logotype").val(file.getUrl());
                } );
            }
        });
    })

    $(".logomark").on("click",function(){
        CKFinder.modal({
            chooseFiles: true,
            width: 800,
            height: 600,
            onInit: function( finder ) {
                finder.on( 'files:choose', function( evt ) {
                    var file = evt.data.files.first();
                    $("#logomark").val(file.getUrl());
                } );
            }
        });
    })
}
 
TimesWriter.Thumbnail = function() 
{
    $(".btn-add-thumbnail").on("click",function(){
        CKFinder.modal( {
            chooseFiles: true,
            width: 800,
            height: 600,
            onInit: function( finder ) {
                finder.on( 'files:choose', function( evt ) {
                    var file = evt.data.files.first();
                    $("#media").val(file.getUrl());
                    $("#noMedia").css("display", "none");
                    $("#hasMedia").css("display", "block");
                    $("#hasMedia > img").attr("src", file.getUrl());
                } );
            }
        } );
    })

    $(".btn-delete-thumbnail").on("click",function(){
        $("#noMedia").css("display", "block");
        $("#hasMedia").css("display", "none");
    })
}

/**
 * SMTP
 */
 TimesWriter.SMTP = function()
 {
     // Smtp form
     if ($("#smtp-form").length == 1) {
         $("#smtp-form :input[name='auth']").on("change", function() {
             if ($(this).is(":checked")) {
                 $("#smtp-form :input[name='username'], :input[name='password']")
                 .prop("disabled", false);
             } else {
                 $("#smtp-form :input[name='username'], :input[name='password']")
                 .prop("disabled", true)
                 .val("");
             }
         }).trigger("change");
     }
 }

 TimesWriter.UserActive = function()
 {
    $("body").on("click", ".js-active-user", function() {
        var ids = [$(this).data("id")];
        ids = ids.filter(Boolean);
        if(ids.length == 0) document.querySelectorAll('input[name="delete_items[]"]:checked').forEach(item => ids.push(item.value));
        if(ids.length == 0){
            Swal.fire('Oops...', "Thiếu danh sách ID", 'error');
            return;
        }
        var url = $(this).data("url");
        var active = $(this).data("active");

        $form = $(this).parents(".main-content");
        $form.addClass('block-mode-loading');
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'jsonp',
            data: {
                action: "active",
                ids: ids,
                active: active
            },
            error: function() {
                $form.removeClass('block-mode-loading');
                Swal.fire('Oops...', "Oops! Đã xảy ra lỗi. Vui lòng thử lại sau!", 'error')
            },
            success: function(resp) {
                $form.removeClass('block-mode-loading');
                if(resp.result == 0){
                    Swal.fire('Oops...', resp.msg, 'error')
                }else if(resp.reload){
                    window.location.reload()
                }else{
                    window.location.href = resp.redirect;
                }
                
            }
        });
    });
 }

 TimesWriter.ReplyCommnet = function() {
    let editor;
    $("body").on("click", ".js-reply-list-item", function() {
        
        if(document.querySelector('.ck-editor__editable')) document.querySelector('.ck-editor__editable').ckeditorInstance.destroy()
        $(".reply").remove(); 

        $this = $(this);
        $elm = $this.parents("td");
        
        if($elm.find(".reply").length == 0){
            $elm.append('<div class="reply">'+
            '<textarea name="reply" id="reply"></textarea>'+
            '<input type="hidden" name="commment_parent" id="commment_parent" value="'+$this.data("id")+'"/>'+
            '<br/>'+
            '<button type="button" class="btn btn-primary waves-effect waves-light js-agree-reply" >Đăng </button> '+
            '<button type="button" class="btn btn-danger waves-effect waves-light js-cancel-reply">Huỷ </button>'+
            '</div>')
        }

        ClassicEditor
        .create( document.querySelector( '#reply' ) )
        .then( newEditor => {
            editor = newEditor;
        } )
        .catch( error => {
            console.error( error );
        } );
    });

    $("body").on("click", ".js-cancel-reply", function() {
        if(document.querySelector('.ck-editor__editable')) document.querySelector('.ck-editor__editable').ckeditorInstance.destroy()
        $(".reply").remove(); 
    });

    $("body").on("click", ".js-agree-reply", function() {
        $this = $(this);
        $elm = $this.parents("td");
        $comment_parent = $elm.find("#commment_parent").val();
        $comment_content = editor.getData();

        var url = $(this).data("url");

        $form = $this.parents(".main-content");
        $form.addClass('block-mode-loading');
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'jsonp',
            data: {
                action: "reply",
                comment_parent: $comment_parent,
                comment_content: $comment_content,
            },
            error: function() {
                $form.removeClass('block-mode-loading');
                Swal.fire('Oops...', "Oops! Đã xảy ra lỗi. Vui lòng thử lại sau!", 'error')
            },
            success: function(resp) {
                $form.removeClass('block-mode-loading');
                if(resp.result == 0){
                    Swal.fire('Oops...', resp.msg, 'error')
                }else if(resp.reload){
                    window.location.reload()
                }else{
                    window.location.href = resp.redirect;
                }
                
            }
        });
        
    });
 }

/* Functions */

/**
 * Validate Email
 */
function isValidEmail(email) {
    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    return re.test(email);
}

/**
 * Get scrollbar width
 */
function scrollbarWidth(){
    var scrollDiv = document.createElement("div");
    scrollDiv.className = "scrollbar-measure";
    document.body.appendChild(scrollDiv);
    var w = scrollDiv.offsetWidth - scrollDiv.clientWidth;
    document.body.removeChild(scrollDiv);

    return w;
}


/**
 * Validate URL
 */
function isValidUrl(url) {
    return /^(https?|s?ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(url);
}


/**
 * Get the position of the caret in the contenteditable element
 * @param  {DOM}  DOM of the input element
 * @return {obj}  start and end position of the caret position (selection)
 */
function getCaretPosition(element) {
    var start = 0;
    var end = 0;
    var doc = element.ownerDocument || element.document;
    var win = doc.defaultView || doc.parentWindow;
    var sel;

    if (typeof win.getSelection != "undefined") {
        sel = win.getSelection();
        if (sel.rangeCount > 0) {
            var range = win.getSelection().getRangeAt(0);
            var preCaretRange = range.cloneRange();
            preCaretRange.selectNodeContents(element);
            preCaretRange.setEnd(range.startContainer, range.startOffset);
            start = preCaretRange.toString().length;
            preCaretRange.setEnd(range.endContainer, range.endOffset);
            end = preCaretRange.toString().length;
        }
    } else if ( (sel = doc.selection) && sel.type != "Control") {
        var textRange = sel.createRange();
        var preCaretTextRange = doc.body.createTextRange();
        preCaretTextRange.moveToElementText(element);
        preCaretTextRange.setEndPoint("EndToStart", textRange);
        start = preCaretTextRange.text.length;
        preCaretTextRange.setEndPoint("EndToEnd", textRange);
        end = preCaretTextRange.text.length;
    }
    return { start: start, end: end };
}


function ChangeToSlug(title){
    var slug;
    //Lấy text từ thẻ input title 
 
    //Đổi chữ hoa thành chữ thường
    slug = title.toLowerCase();
 
    //Đổi ký tự có dấu thành không dấu
    slug = slug.replace(/á|à|ả|ạ|ã|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ/gi, 'a');
    slug = slug.replace(/é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/gi, 'e');
    slug = slug.replace(/i|í|ì|ỉ|ĩ|ị/gi, 'i');
    slug = slug.replace(/ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ/gi, 'o');
    slug = slug.replace(/ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự/gi, 'u');
    slug = slug.replace(/ý|ỳ|ỷ|ỹ|ỵ/gi, 'y');
    slug = slug.replace(/đ/gi, 'd');
    //Xóa các ký tự đặt biệt
    slug = slug.replace(/\`|\~|\!|\@|\#|\||\$|\%|\^|\&|\*|\(|\)|\+|\=|\,|\.|\/|\?|\>|\<|\'|\"|\:|\;|_/gi, '');
    //Đổi khoảng trắng thành ký tự gạch ngang
    slug = slug.replace(/ /gi, "-");
    //Đổi nhiều ký tự gạch ngang liên tiếp thành 1 ký tự gạch ngang
    //Phòng trường hợp người nhập vào quá nhiều ký tự trắng
    slug = slug.replace(/\-\-\-\-\-/gi, '-');
    slug = slug.replace(/\-\-\-\-/gi, '-');
    slug = slug.replace(/\-\-\-/gi, '-');
    slug = slug.replace(/\-\-/gi, '-');
    //Xóa các ký tự gạch ngang ở đầu và cuối
    slug = '@' + slug + '@';
    slug = slug.replace(/\@\-|\-\@|\@/gi, '');
    return slug;
}