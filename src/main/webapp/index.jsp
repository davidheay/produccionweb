<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%@include file="/templates/head.jsp" %> 

        <script src='codebase/dhtmlxscheduler.js?v=5.3.1' type="text/javascript" charset="utf-8"></script>
        <script src='codebase/ext/dhtmlxscheduler_timeline.js' type="text/javascript" charset="utf-8"></script>

        <script src='codebase/ext/dhtmlxscheduler_treetimeline.js?v=5.3.1' type="text/javascript" charset="utf-8"></script>
        <script src='codebase/ext/dhtmlxscheduler_tooltip.js?v=5.3.1' type="text/javascript" charset="utf-8"></script>
        <script src='codebase/ext/dhtmlxscheduler_agenda_view.js' type="text/javascript" charset="utf-8"></script>
        <script src='codebase/ext/dhtmlxscheduler_active_links.js' type="text/javascript" charset="utf-8"></script>

        <link rel='stylesheet' type='text/css' href='codebase/dhtmlxscheduler_material.css?v=5.3.1'>
        <script src='MRPJS/index.js' type="text/javascript" charset="utf-8"></script>
        <script src="codebase/locale/locale_es.js" type="text/javascript" charset="utf-8"></script>

        <style type="text/css" >
            html, body{
                margin:0;
                padding:0;
                height:100%;
                overflow:hidden;
            }
            .estadoP{
                color: BLACK !important;
                background-color: #66ed41 !important;
            }
            .estadoM{
                color: BLACK !important;
                background-color: #A3FFAC !important;
            }
            .estadoG{
                color: white !important;
                background-color: green !important;
            }
            .estadot1T{
                color:   #66ed41 !important;
            }
            .estadot2T{
                color:   #A3FFAC  !important;
            }
            .estadot3T{
                color: green !important;
            }
            #convenciones{
                left: 73%;
                top: 18px;
                line-height: 2px;
                font-size: 16px;
                text-align: justify;

            }
            p{

                margin-bottom: 0.1rem!important;
            }
            .tab {
                width: 88px;
                height: 29px;
                background-color: none;
                text-align: center;
                text-decoration: none;
                text-transform: uppercase;
                font-weight: 500;
                padding-top: 1px;
                border-radius: 0;
                cursor: pointer;
                border: 1px solid #0288d1;
                color: #0288d1;
                font-size: inherit;
                line-height: 30px
            }

            .sidenav {
                height: 100%;
                width: 0;
                position: fixed;
                z-index: 100002;
                top: 0;
                left: 0;
                background-color: #003C82 !important;
                overflow-x: hidden;
                transition: 0.5s;
                padding-top: 60px;

            }

            .sidenav a {
                padding: 8px 8px 8px 32px;
                text-decoration: none;
                font-size: 25px;
                color: #fff3cd;
                display: block;
                transition: 0.3s;
            }

            .sidenav a:hover {
                top: -5px;
                color: #414040;
            }

            .sidenav .closebtn {
                color:black;
                position: absolute;
                top: 0;
                right: 25px;
                font-size: 36px;
                margin-left: 50px;
            }

            @media screen and (max-height: 450px) {
                .sidenav {padding-top: 15px;}
                .sidenav a {font-size: 18px;}
            }
            .modalLoad {
                display: none;
                position: fixed;
                z-index: 1000;
                top: 0;
                left: 0;
                height: 100%;
                width: 100%;
                background: rgba( 144, 144, 144, .4) url('imgs/gifloader.gif') 50% 50% no-repeat;
            }
            body.loading {
                overflow: hidden;
            }
            body.loading .modalLoad {
                display: block;
            }
            .especialInput{
                width: 40px;
                background-color: transparent;
                border-width: 0px;
                color: white;

            }
        </style>


    </head>
    <body>
        <div class="modalLoad ">
        </div>
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Bienvenido</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group row">
                            <label for="example-date-input" class="col-2 col-form-label">Fecha de inicio</label>
                            <div class="col-10">
                                <input id="fecha" class="form-control" type="date" value="2011-08-19" id="example-date-input">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="example-time-input" class="col-2 col-form-label">Time</label>
                            <div class="col-10">
                                <input id="hora" class="form-control" type="time" value="08:00:00" id="example-time-input">
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">

                        <button id="boton" type="button" class="btn btn-primary" data-dismiss="modal">Generar cronograma</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="mySidenav" class="sidenav" style="color: black;background-color:#E9ECEF !IMPORTANT ">
            <h5 class="text-center title-nav" style="margin-top: -36px">Demanda</h5>

            <div class="row" style="font-size:0.7vw;">
                <div class="col text-center">
                    <table class="table table-striped table-dark" style="font-size: 18px">
                        <thead class="thead-dark" style="text-align: center">
                            <tr>
                                <th style="width: 25%">Tipo</th>

                                <th style="width: 25%">Cuadriculado</th>
                                <th style="width: 25%">Rayado</th>
                                <th style="width: 25%">Ferrocarril</th>
                            </tr>
                        </thead>
                        <tbody id="infoTb" style="text-align: center">
                        </tbody>

                    </table>
                    <button id="actualizar" class="btn btn-primary"> Actualizar</button>
                </div>
            </div>
            <br>
            <h5 class="text-center title-nav"> Capacidades</h5>

            <div class="row" style="font-size:0.7vw;">
                <div class="col">
                    <table class="table table-striped table-dark" style="font-size: 18px">
                        <thead class="thead-dark" style="text-align: center">
                            <tr>
                                <th>Centro de trabajo</th>
                                <th>Unidades</th>
                                <th >Hora</th>
                            </tr>
                        </thead>
                        <tbody id="capacidadTb" style="text-align: center">
                        </tbody>

                    </table>
                </div>
            </div>

            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        </div>
        <div id="scheduler_here" class="dhx_cal_container" style='width:100%; height:100%;'>
            <div class="dhx_cal_navline">
                <div class="dhx_cal_prev_button">&nbsp;</div>
                <div class="dhx_cal_next_button">&nbsp;</div>
                <div class="dhx_cal_today_button"></div>
                <div class="dhx_cal_date"></div>
                <div class="tab" onclick="openNav();" style="right: auto;width: 97px;left: 472px;">Demanda</div>
                <div class="dhx_cal_tab" name="day_tab" style="right:204px;"></div>
                <div class="dhx_cal_tab" name="week_tab" style="right:140px;"></div>
                <div class="dhx_cal_tab" name="month_tab" style="right:76px;"></div>
                <div class="dhx_cal_tab" name="timeline_tab" style="right:280px;"></div>
                <div class="dhx_cal_tab" name="agenda_tab" style="left: 496px;"></div>

                <div id ="convenciones"class="dhx_cal_date">
                    <p><i class="fas fa-square estadot1T"></i> Pequeño</p>
                    <p><i class="fas fa-square estadot2T"></i> Mediano</p>
                    <p><i class="fas fa-square estadot3T"></i> Grande</p>
                </div>
            </div>
            <div class="dhx_cal_header">
            </div>
            <div class="dhx_cal_data">
            </div>		
        </div>
    </body>
</html>
