var TimesWriter = {};

TimesWriter.CheckAll = function(){
    $("body").on("click", "#check-all", function(){
        var isCheck = $(this).is(":checked");
        document.getElementsByName('items[]').forEach(item => item.checked = isCheck);
    });
}


