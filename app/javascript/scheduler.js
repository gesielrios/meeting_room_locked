$(function() {
    $('a.locked-link').click(function(event) {
        event.preventDefault();

        var id = $(this).attr('id'), dayIndex = id.split(/\_/)[0], timeStart = id.split(/\_/)[1];
        var $this = $(this);
        
        $.ajax({
            url: '/toggle_register.json',
            type: 'get',
            data: {'day_index': dayIndex, 'time_start': timeStart},
        }).done(function(data) {
            if(data.register == 'ok') {
                $this.html('Delete');
                $this.parent().find('span').html('Locked for ' + data.email);
            } else if(data.register == 'fail') {
                window.alert("This room has already been reserved.");
                location.reload();
            } else if(data.unregister) {
                $this.html('Avaliable');
                $this.parent().find('span').html('');
            }
        });  
    });
});