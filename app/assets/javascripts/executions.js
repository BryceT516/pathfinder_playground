function draw_map() {
    console.log("drawing map...");

    var canvas = $("#arena");

    if (canvas[0]) {
        var context = canvas[0].getContext('2d');
        var data = $("#data");

        console.log("Map id = " + data.data('map') + ", Agent id = " + data.data('agent'));

        $.getJSON("/arena_api/maps/" + data.data('map'), function (resp) {

            draw_start_point(context, resp.start_point_x, resp.start_point_y);
            draw_end_point(context, resp.end_point_x, resp.end_point_y);

            $.each(resp.polygons, function (index, polygon) {
                var vertex_counter = 0;
                context.beginPath();
                $.each(polygon.vertices, function (index, vertex) {
                    if (vertex_counter == 0) {
                        context.moveTo((vertex.x - 100) * 3, (700 - vertex.y) * 3);
                        vertex_counter++;
                    } else {
                        context.lineTo((vertex.x - 100) * 3, (700 - vertex.y) * 3);
                        vertex_counter++;
                    }
                });
                context.closePath();
                context.stroke();
            });
        });

        // draw_agent(context);
    }
    return;
}

function draw_start_point(context, x, y) {
    var radius = 10;

    context.beginPath();
    context.arc((x - 100) * 3, (700 - y) * 3, radius, 0, 2 * Math.PI, false);
    context.fillStyle = 'green';
    context.fill();
    context.lineWidth = 1;
    context.strokeStyle = '#003300';
    context.stroke();
}

function draw_end_point(context, x, y) {
    var radius = 10;

    context.beginPath();
    context.arc((x - 100) * 3, (700 - y) * 3, radius, 0, 2 * Math.PI, false);
    context.fillStyle = 'red';
    context.fill();
    context.lineWidth = 1;
    context.strokeStyle = '#003300';
    context.stroke();
}

// function draw_agent(context) {
//     console.log("drawing agent...");
//
//     var data = $("#data");
//
//     console.log("Drawing Agent from execution id = " + data.data('execution'));
//
//     $.getJSON("/arena_api/executions/" + data.data('execution'), function (resp) {
//         console.log(resp);
//
//         draw_agent_point(context, resp.agent_current_x, resp.agent_current_y);
//     });
//
//     return;
// }
//
// function draw_agent_point(context, x, y) {
//     var radius = 5;
//
//     context.beginPath();
//     context.arc((x - 100) * 3, (700 - y) * 3, radius, 0, 2 * Math.PI, false);
//     context.fillStyle = 'pink';
//     context.fill();
//     context.lineWidth = 1;
//     context.strokeStyle = '#003300';
//     context.stroke();
// }

function start_up() {
    console.log("Start up.....");
    draw_map();
    let agent = new Agent($("#data").data('agent'));
    agent.draw();
}

$(document).on('turbolinks:load', start_up);

class Agent {

    constructor(agent_id) {
        this.agent_id = agent_id;
        this.current_x = 0;
        this.current_y = 0;
        var data = $("#data");
        $.getJSON("/arena_api/executions/" + data.data('execution'), function (resp) {
            this.current_x = resp.agent_current_x;
            this.current_y = resp.agent_current_y;
        });
        var canvas = $("#arena");

        this.context = canvas[0].getContext('2d');
    }

    draw() {
        var radius = 5;

        this.context.beginPath();
        this.context.arc((this.current_x - 100) * 3, (700 - this.current_y) * 3, radius, 0, 2 * Math.PI, false);
        this.context.fillStyle = 'pink';
        this.context.fill();
        this.context.lineWidth = 1;
        this.context.strokeStyle = '#003300';
        this.context.stroke();
    }
}

function step() {
    console.log("*************** Step! ****************");
    agent.draw();

    // Make request for agent's next potential moves
    // Draw those lines
    //

}