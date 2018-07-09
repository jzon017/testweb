$(document).ready(function(){
        var date_input=$('input[name="dtrdate]'); //our date input has the name "date"
        var container=$('.student-reg-form form').length>0 ? $('.student-reg-form form').parent() : "body";
        date_input.datepicker({
            format: 'mm/dd/yyyy',
            container: container,
            todayHighlight: true,
            autoclose: true,
        });
        date_input.datepicker(options);
    })