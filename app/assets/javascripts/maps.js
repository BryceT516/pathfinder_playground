function draw() {
    var canvas = $("#tutorial");
    if (canvas[0]) {
        var context = canvas[0].getContext('2d');
        var other_thing = $("#other_thing");

        // context.fillRect(25, 25, 100, 100);
        // context.clearRect(45, 45, 60, 60);
        // context.strokeRect(50, 50, 50, 50);

        console.log("Message = " + other_thing.data('message'));

        $.getJSON("/arena_api/maps/" + other_thing.data('message'), function (resp) {
            console.log(resp);

            $.each(resp.polygons, function (index, polygon) {
                console.log(polygon);
                var vertex_counter = 0;
                context.beginPath();
                $.each(polygon.vertices, function (index, vertex) {
                    console.log(vertex);
                    console.log("X = " + vertex.x);
                    console.log("Y = " + vertex.y);
                    if (vertex_counter == 0) {
                        context.moveTo((vertex.x - 100)*3, (700 - vertex.y)*3);
                        vertex_counter++;
                    } else {
                        context.lineTo((vertex.x - 100)*3, (700 - vertex.y)*3);
                        vertex_counter++;
                    }
                });
                context.closePath();
                context.stroke();
            });

            // Log each key in the response data
            // $.each( resp, function( key, value ) {
            //     console.log( key + " : " + value );
            // });
        });
    }


    return;
}


// $(document).ready(draw)
$(document).on('turbolinks:load', draw);