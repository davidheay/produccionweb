/* 
 * 06-06-2019
 *  
 */


/* global scheduler */
var ya = false;

function openNav() {
    document.getElementById("mySidenav").style.width = "50%";


}


function closeNav() {
    document.getElementById("mySidenav").style.width = "0";


}

function gifLoad() {
    $("body").addClass("loading");
}

/*
 * Funcion para ocultar el gif de carga ajax
 * @returns 
 */
function removeGifLoad() {
    $("body").removeClass("loading");
}

function converTipo(param) {
    var tex = "";
    var param = param + "";
    if (param.includes("CC")) {
        tex += "Cuadriculado";
    }
    if (param.includes("CF")) {
        tex += "Ferrocarril";
    }
    if (param.includes("CR")) {
        tex += "Rayado";
    }

    return tex;

}

function converCentro(param) {
    var tex = "";
    var param = param + "";
    if (param.includes("1")) {
        tex += "Produccion papel";
    }
    if (param.includes("2")) {
        tex += "Producccion cartulina";
    }
    if (param.includes("3")) {
        tex += "Trasnformar hojas";
    }
    if (param.includes("4")) {
        tex += "Transformar tapas";
    }
    if (param.includes("5")) {
        tex += "Ensamblaje";
    }

    return tex;

}
function convertirfecha(fecha) {

    var h = fecha.getHours();
    var m = fecha.getMinutes();
    var s = fecha.getSeconds();
    var dd = String(fecha.getDate()).padStart(2, '0');
    var mm = String(fecha.getMonth() + 1).padStart(2, '0');
    var yyyy = fecha.getFullYear();

    m = checkTime(m);
    s = checkTime(s);
    return yyyy + "-" + mm + "-" + dd + " " + h + ":" + m + ":" + s;
}
function convertirfechaInp(fecha) {

    var h = fecha.getHours();
    var m = fecha.getMinutes();
    var s = fecha.getSeconds();
    var dd = String(fecha.getDate()).padStart(2, '0');
    var mm = String(fecha.getMonth() + 1).padStart(2, '0');
    var yyyy = fecha.getFullYear();

    m = checkTime(m);
    s = checkTime(s);
    return yyyy + "-" + mm + "-" + dd;
}
function checkTime(i) {
    if (i < 10) {
        i = "0" + i;
    }
    return i;

}
function converTama(param) {
    var tex = "";
    switch (param) {
        case "P":
            tex += "Pequeño";
            break;

        case "M":
            tex += "Mediano";
            break;
        case "G":
            tex += "Grande";
            break;
        default:

            break;
    }
    return tex;

}
$(document).ready(function() {

    $('#myModal').on('hidden.bs.modal', function(e) {
        if (ya === false) {
            $('#myModal').modal("show");
        }

    });
    $("#boton").click(function() {
        ya = true;
        llenar($('#fecha').val(), $('#hora').val());
    });
    $("#actualizar").click(function() {
        $.ajax({
            type: 'post',
            data: {P0: $('#0').val(), P1: $('#1').val(), P2: $('#2').val(), P3: $('#3').val(), P4: $('#4').val(), P5: $('#5').val(), P6: $('#6').val(), P7: $('#7').val(), P8: $('#8').val()},
            url: 'AjaxActualizarDemanda',
            beforeSend: function() {
                gifLoad();
            },
            complete: function() {
                removeGifLoad();
            },
            success: function(resp) {

                location.reload(true);
            }
        });
    });


    scheduler.locale.labels.timeline_tab = "Timeline";
    scheduler.locale.labels.section_custom = "Section";
    scheduler.locale.labels.timeline_scale_header = "Centros de trabajo";
    scheduler.config.details_on_create = false;
    scheduler.config.details_on_dblclick = false;
    scheduler.config.drag_resize = false;
    scheduler.config.drag_move = false;
    scheduler.config.readonly = true;

    //===============
    //Configuration
    //===============	

    elements = [

    ];


    var days = 7;
    scheduler.createTimelineView({
        section_autoheight: true,
        name: "timeline",
        x_unit: "hour",
        x_date: "%H:%i",
        x_step: 1,
        x_size: 24 * days,
        scrollable: true,
        scroll_position: new Date(),
        column_width: 60,
        x_length: 24 * days,
        y_unit: elements,
        y_property: "section_id",
        render: "tree",
        second_scale: {
            x_unit: "day", // unit which should be used for second scale
            x_date: "%F %d" // date format which should be used for second scale, "July 01"
        }
    });



    //===============
    //Data loading
    //===============
    scheduler.config.lightbox.sections = [
        {name: "description", height: 60, map_to: "text", type: "textarea", focus: true},
        {name: "custom", height: 30, type: "timeline", options: null, map_to: "section_id"}, //type should be the same as name of the tab
        {name: "time", height: 72, type: "time", map_to: "auto"}
    ];

    scheduler.init('scheduler_here', new Date(), "timeline");
    $('#fecha').val(convertirfechaInp(new Date()));
    $('#myModal').modal("show");
});

function llenar(fecha, hora) {

    console.log("ready");
    $.ajax({
        type: 'post',
        data: {hora: hora, fecha: fecha},
        url: 'AjaxEventos',
        beforeSend: function() {
            gifLoad();
        },
        complete: function() {
            removeGifLoad();
        },
        success: function(resp) {
            var json = resp.eventosVista;
            var demanda = resp.demanda;
            var centros = resp.centroTrabajos;
            console.log(demanda);
            var text = "";
            var c = 0;
            for (var i = 0; i < demanda.tamaños.length; i++) {
                text += "<tr>" + "<td>" + converTama(demanda.tamaños[i].nombre) + "</td>";
                for (var j = 0; j < demanda.tamaños[i].productos.length; j++) {
                    text += "<td><input type='text' class='especialInput' id='" + c + "'value='" + demanda.tamaños[i].productos[j].cantidad + "'></td>";
                    c++;
                }
                text += "</tr>";
            }
            console.log(text);
            $("#infoTb").html(text);
            var text = "";
            for (var i = 0; i < centros.length; i++) {
                text += "<tr>" +
                        "<td>" + centros[i].nombre + "</td>" +
                        "<td>" + centros[i].capacidad.unidades + "</td>" +
                        "<td>" + centros[i].capacidad.horas + "</td>" +
                        "</tr>";
            }
            $("#capacidadTb").html(text);
            scheduler.locale.labels.timeline_tab = "Timeline";
            scheduler.locale.labels.section_custom = "Section";
            scheduler.locale.labels.timeline_scale_header = "Centros de trabajo";
            scheduler.config.details_on_create = false;
            scheduler.config.details_on_dblclick = false;
            scheduler.config.drag_resize = false;
            scheduler.config.drag_move = false;
            scheduler.config.readonly = true;
            //===============
            //Configuration
            //===============

            var elements = [// original hierarhical array to display
                {key: 1, label: centros[0].nombre, open: true, children: [
                        {key: '1CC', label: "Cuadriculado"},
                        {key: '1CF', label: "Ferrocarril"},
                        {key: '1CR', label: "Rayado"}
                    ]},
                {key: 2, label: centros[1].nombre, open: true, children: [
                        {key: '2CC', label: "Cuadriculado"},
                        {key: '2CF', label: "Ferrocarril"},
                        {key: '2CR', label: "Rayado"}
                    ]},
                {key: 3, label: centros[2].nombre, open: true, children: [
                        {key: '3CC', label: "Cuadriculado"},
                        {key: '3CF', label: "Ferrocarril"},
                        {key: '3CR', label: "Rayado"}
                    ]},
                {key: 4, label: centros[3].nombre, open: true, children: [
                        {key: '4CC', label: "Cuadriculado"},
                        {key: '4CF', label: "Ferrocarril"},
                        {key: '4CR', label: "Rayado"}
                    ]},
                {key: 5, label: centros[4].nombre, open: true, children: [
                        {key: '5CC', label: "Cuadriculado"},
                        {key: '5CF', label: "Ferrocarril"},
                        {key: '5CR', label: "Rayado"}
                    ]}

            ];
            var days = 7;
            scheduler.createTimelineView({
                section_autoheight: true,
                name: "timeline",
                x_unit: "hour",
                x_date: "%H:%i",
                x_step: 1,
                x_size: 24 * days,
                scrollable: true,
                scroll_position: new Date(2017, 6, 2),
                column_width: 55,
                x_length: 24 * days,
                y_unit: elements,
                y_property: "section_id",
                render: "tree",
                second_scale: {
                    x_unit: "day", // unit which should be used for second scale
                    x_date: "%F %d" // date format which should be used for second scale, "July 01"
                }
            });
            //===============
            //Data loading
            //===============
            scheduler.config.lightbox.sections = [
                {name: "description", height: 50, map_to: "text", type: "textarea", focus: true},
                {name: "custom", height: 30, type: "select", options: null, map_to: "section_id"},
                {name: "time", height: 72, type: "time", map_to: "auto"}
            ];
            scheduler.templates.tooltip_text = function(start, end, ev) {
                var tex = "";
                tex += "<b>Centro:</b>";
                tex += "" + converCentro(ev.section_id);
                tex += "<br><b>Producto:</b>";
                tex += converTipo(ev.section_id);
                tex += "<br><b>Tamaño:</b>";
                tex += converTama(ev.tamaño);
                tex += "<br><b>Fecha Inicio</b> " + convertirfecha(ev.start_date);
                tex += "<br><b>Fecha Fin</b> " + convertirfecha(ev.end_date);
                return tex;
            };
            scheduler.templates.event_class = function(start, end, event) {
                var css = "";
                css += "estado" + event.tamaño;
                return css;
            };
            var start = fecha + " " + hora;

            scheduler.config.xml_date = "%Y-%m-%d %h:%i";
            scheduler.init('scheduler_here', start, "timeline");
            scheduler.parse(json); //generateEvents(start, scheduler.date.add(start, days, "day"), sections.length * 10, sections));

            console.log(json);
            function randomDate(date1, date2) {
                function getRandomArbitrary(min, max) {
                    return Math.random() * (max - min) + min;
                }
                var date1 = date1;
                var date2 = date2;
                date1 = new Date(date1).getTime();
                date2 = new Date(date2).getTime();
                if (date1 > date2) {
                    return new Date(getRandomArbitrary(date2, date1));
                } else {
                    return new Date(getRandomArbitrary(date1, date2));
                }
            }

            function randomIntFromInterval(min, max)
            {
                return Math.floor(Math.random() * (max - min + 1) + min);
            }

            function generateEvents(from, to, count, sections) {
                var evs = [];
                for (var i = 0; i < count; i++) {
                    var ev = {
                        section_id: sections[randomIntFromInterval(0, sections.length - 1)].key,
                        text: "event " + i,
                        start_date: randomDate(from, to),
                        id: scheduler.uid()
                    };
                    ev.end_date = scheduler.date.add(ev.start_date, randomIntFromInterval(1, 24), "hour");
                    evs.push(ev);
                }
                return evs;
            }
        }, error() {


        },
        async: true
    });
}


//});
scheduler.showLightbox = function(id, texto) {
    return false;
};