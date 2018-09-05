

class Agent {

    constructor() {
        this.agent_id = null;
        this.execution_id = null;
        this.current_x = 0;
        this.current_y = 0;
        this.step_count = 0;
        this.move_step = false;
    }

    initialize_after_pageload() {
        var data = $("#data");
        this.agent_id = data.data('agent');
        this.execution_id = data.data('execution');
        $.getJSON("/arena_api/executions/" + data.data('execution'), function (resp) {
            console.log('made ajax call for execution info...');
            console.log(resp);
            agent.current_x = resp.agent_current_x;
            agent.current_y = resp.agent_current_y;
        });

        this.context = $("#arena")[0].getContext('2d');
    }

    step() {
        console.log("agent step....");
        console.log(this);
        if (this.step_count == 0) {
            this.draw_agent();
            this.move_step = false;
        } else {
            if (this.move_step == true) {
                this.move_agent();
                this.draw_agent();
                this.move_step = false;
            } else {
                this.draw_agent();
                this.get_frontier();
                this.move_step = true;
            }
        }
        this.step_count++;
    }

    get_frontier() {
        $.getJSON("/arena_api/executions/" + this.execution_id + "/frontier", function (resp) {
            console.log('made ajax call for frontier points...');
            console.log(resp);
            $.each(resp, function (index, vertex) {
                agent.draw_line(agent.current_x, agent.current_y, vertex.x, vertex.y);
            });
        });
    }

    draw_line(start_x, start_y, end_x, end_y) {
        this.context.moveTo((start_x - 100) * 3, (700 - start_y) * 3);
        this.context.lineTo((end_x - 100) * 3, (700 - end_y) * 3);
        this.context.lineWidth = 2;
        this.context.strokeStyle = 'green';
        this.context.stroke();
    }

    draw_agent() {
        console.log("Drawing agent...")
        var radius = 5;

        this.context.beginPath();
        this.context.arc((this.current_x - 100) * 3, (700 - this.current_y) * 3, radius, 0, 2 * Math.PI, false);
        this.context.fillStyle = 'pink';
        this.context.fill();
        this.context.lineWidth = 1;
        this.context.strokeStyle = '#003300';
        this.context.stroke();
    }

    move_agent() {
        console.log("Move agent...")
        $.getJSON("/arena_api/executions/" + this.execution_id + "/move_agent", function (resp) {
            console.log('made ajax call for move agent...');
            console.log(resp);
            agent.current_x = resp.x;
            agent.current_y = resp.y;
            agent.draw_agent();
        });
    }
}


var agent = new Agent();


function draw_map() {
    console.log("drawing map...");

    var canvas = $("#arena");

    if (canvas[0]) {
        var context = canvas[0].getContext('2d');
        var data = $("#data");

        console.log("Map id = " + data.data('map') + ", Agent id = " + data.data('agent'));

        $.getJSON("/arena_api/maps/" + data.data('map'), function (resp) {

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
                context.fillStyle = 'grey';
                context.fill();
            });
        });

        $.getJSON("/arena_api/executions/" + data.data('execution'), function (resp) {
            draw_start_point(context, resp.start_point_x, resp.start_point_y);
            draw_end_point(context, resp.end_point_x, resp.end_point_y);
        });
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


function start_up() {
    console.log("Start up.....");
    draw_map();
    console.log(agent);
    agent.initialize_after_pageload();
    console.log(agent);
}

$(document).on('turbolinks:load', start_up);


function step() {
    console.log("*************** Step! ****************");
    agent.step();

}

function reset() {
    console.log("______________ RESET! ________________");
    var data = $("#data");
    $.getJSON("/arena_api/executions/" + data.data('execution') + "/reset", function (resp) {
        console.log(resp);
    });
    location.reload();
}
