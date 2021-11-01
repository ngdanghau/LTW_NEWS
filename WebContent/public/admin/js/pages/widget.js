/*!
 * oneui - v5.1.0
 * @author pixelcave - https://pixelcave.com
 * Copyright (c) 2021
 */
$( document ).ready(function() {
			  
				
});
One.onLoad(class {
    static initValidation() {
        One.helpers("jq-validation"), jQuery(".widget-form").validate({
            rules: {
                "title": {
                    required: !0,
                    minlength: 6
                },
                "layout": {
                    required: !0
                },
                "cat_id": {
                    required: !0
                }
            },
            messages: {
                "title": {
                    required: "Hãy nhập tiêu đề",
                    minlength: "Tiêu đều phải chứa ít nhất 6 chữ"
                },
                "layout": {
                    required: "Hãy chọn layout",
                },
                "cat_id": {
                    required: "Hãy chọn thể loại",
                }
            },
            submitHandler: function(form) {
            	var form = jQuery(form);
            	var parent = form.parent(".block");
        		parent.addClass('block-mode-loading');
        		
                var url = form.attr("url");
                jQuery.ajax({
                    url: url,
                    type: 'POST',
                    data: form.serialize(),
                    error: function(error) {
                    	parent.removeClass('block-mode-loading');
                        Swal.fire('Oops...', "Oops! Đã xảy ra lỗi. Vui lòng thử lại sau!", 'error')
                    },

                    success: function(resp) {
                    	parent.removeClass('block-mode-loading');
                    	if(resp.result == 0){
                            Swal.fire('Oops...', resp.msg, 'error')
                        }else{
                           console.log(resp.msg);
                        }
                    }
                });
            }
        })
    }
    static init() {
        this.initValidation();
    }
}.init());