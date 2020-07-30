<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="windows-1252" %>
<!DOCTYPE html>
<html>
    <head>    
        <%@include file="/templates/head.jsp" %>         
        <link href="ProgramacionSalaHospicss/stylesindex.css" rel="stylesheet">

        <link rel="stylesheet" href="codebase/dhtmlxscheduler_material.css?v=5.2.1" type="text/css" charset="utf-8">
        <script src="codebase/dhtmlxscheduler.js?v=5.2.1" type="text/javascript" charset="utf-8"></script>
        <script src="codebase/ext/dhtmlxscheduler_limit.js?v=5.2.1" type="text/javascript" charset="utf-8"></script>
        <script src="codebase/ext/dhtmlxscheduler_serialize.js?v=5.2.1" type="text/javascript" charset="utf-8"></script>
        <script src="codebase/ext/dhtmlxscheduler_tooltip.js?v=5.2.1" type="text/javascript" charset="utf-8"></script>
        <script src="codebase/ext/dhtmlxscheduler_active_links.js?v=5.2.1" type="text/javascript" charset="utf-8"></script>
        <script src="codebase/ext/dhtmlxscheduler_collision.js?v=5.2.1" type="text/javascript" charset="utf-8"></script>
        <script src="codebase/ext/dhtmlxscheduler_readonly.js?v=5.2.1" type="text/javascript" charset="utf-8"></script>
        <script src="codebase/ext/dhtmlxscheduler_year_view.js?v=5.2.1" type="text/javascript" charset="utf-8"></script>
        <!--<script src="codebase/ext/dhtmlxscheduler_agenda_view.js?v=5.2.1" type="text/javascript" charset="utf-8"></script>-->
        <script src="codebase/ext/dhtmlxscheduler_pdf.js?v=5.2.1" type="text/javascript" charset="utf-8"></script>
        <script src="codebase/ext/api.js?v=5.2.1" type="text/javascript" charset="utf-8"></script>
        <script src="codebase/ext/dhtmlxscheduler_all_timed.js?v=5.2.1" type="text/javascript" charset="utf-8"></script>
        <script src="codebase/sources/locale/locale_es.js" charset="utf-8"></script>

    </head>

    <body onload="fir();">  
        <div id="mySidenav" class="sidenav" style="color: black;background-color:#E9ECEF !IMPORTANT ">
            <h5 class="text-center title-nav"> Pacientes en espera</h5>
            
            <div class="row" style="font-size:0.7vw;">
                <div class="col">
                    <table class="table table-striped table-light">
                        <thead class="thead-light">
                            <tr>
                                <th style="width: 20%">Paciente</th>

                                <th style="width: 50%">Observación</th>
                                <th style="width: 20%">Quien ordena</th>
                                <th style="width: 10%">Oportunidad<br>DD HH:MM</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${lstPacientes}">
                                <tr>
                                    <td><c:out value="${item.getNombre()}"></c:out> <br><c:out value="${item.getTipoDocumento()}"></c:out> - <c:out value="${item.getDocumento()}"></c:out></td>
                                    <td> <c:out value="${item.getObservaciones()}"></c:out></td>
                                    <td> <c:out value="${item.getMedicoOrd()}"></c:out></td>
                                    <td> <c:out value="${item.getOportunidad()}"></c:out></td>
                                </tr>


                            </c:forEach>
                    </table>
                </div>
            </div>

            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        </div>


    </div>

    <div class="modalLoad ">
    </div>
    <%@include file="/templates/header.jsp" %> 
    <div class="alert alert-success " id="success-alert"  hidden="true">
        <button type="button" class="close" data-dismiss="alert">x</button>
        <strong>Correcto! </strong> Programacion exitosa
    </div>
    
    <div class="alert alert-success " id="success-alert-cancel"  hidden="true">
        <button type="button" class="close" data-dismiss="alert">x</button>
        <strong>Correcto! </strong> Cancelación exitosa
    </div>
    <div class="alert alert-danger " id="failure-alert-proga" hidden="true">
        <button type="button" class="close" data-dismiss="alert">x</button>
        <strong>Error! </strong> En este rango de tiempo ya se encuentra programado, por favor recargue la pagina 
    </div>
    <div class="alert alert-danger " id="failure-alert-real" hidden="true">
        <button type="button" class="close" data-dismiss="alert">x</button>
        <strong>Error! </strong> Por favor recargue la pagina
    </div>
    <div class="alert alert-danger " id="failure-alert-canc" hidden="true">
        <button type="button" class="close" data-dismiss="alert">x</button>
        <strong>Error! </strong> No se puede cancelar recargue la pagina
    </div>
    
    <div id="scheduler_here" class="dhx_cal_container" style='width:100%; height:95%;'>

        <div class="dhx_cal_navline">

            <!--<div class='dhx_cal_export pdf' id='export_pdf' title='Export to PDF' onclick='create_pdf()'>&nbsp;</div>-->
            <div class='dhx_cal_export excel' id='export_excel' title='Export to Excel' data-toggle="modal" data-target="#modalexcel">&nbsp;</div>

            <div class="dhx_cal_prev_button">&nbsp;</div>
            <div class="dhx_cal_next_button">&nbsp;</div>
            <div class="dhx_cal_today_button"></div>
            <div class="dhx_cal_date"></div>

            <div class="dhx_cal_tab" name="year_tab" style="right:330px;"></div>
            <div class="tab" onclick="openNav();" style="right: auto;width: 97px;left: 391px;"><span class="badge"><c:out value="${lstPacientes.size()}"></c:out></span>En espera</div>
            <!--<div class="dhx_cal_tab" name="agenda_tab" style="right:265px;"></div>-->
            <div class="dhx_cal_tab" name="day_tab" style="right:204px;"></div>
            <div class="dhx_cal_tab" name="week_tab" style="right:140px;"></div>
            <div class="dhx_cal_tab" name="month_tab" style="right:76px;"></div>
            <div id ="time"class="dhx_cal_date"  style="left: 13%;">Year</div>
            <div id ="convenciones"class="dhx_cal_date"  >
                <p><i class="fas fa-square estado_programadotext"></i> Programado</p>
                <p><i class="fas fa-square estado_realizadotext"></i> Realizado</p>
                <p><i class="fas fa-square estado_incumplidotext"></i> Incumplido</p>
            </div>

        </div>
        <div class="dhx_cal_header">
        </div>
        <div class="dhx_cal_data">
        </div>		
    </div>

    <div class="container modal-dialog" id="my_detail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="my_detailLabel">Detalle</h5>
                <button type="button" class="close" onclick="close_form('Detail');">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group" style=" margin-bottom: 0rem !important">
                    <div class="row">
                        <div class="col">
                            <label class="col-md-6 control-label">Documento Paciente</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1"><i class="fas fa-address-card"></i></span>
                                </div>
                                <input id="DocuDetail" type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" disabled>
                            </div>


                            <label class="col-md-6 control-label">Fecha y hora inicial</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1"><i class="fas fa-hourglass-start"></i></span></span>
                                </div>
                                <input id="horain" type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" disabled>
                            </div>

                            <label class="col-md control-label">Encargado del procedimiento</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1"><i class="fas fa-user-md"></i></span></span>
                                </div>
                                <input id="personalDetail" type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" disabled>
                            </div>



                        </div>
                        <div class="col">
                            <label class="col-md-6 control-label">Nombre Paciente</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span></span>
                                </div>
                                <input id="NombreDetail" type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" disabled>
                            </div>


                            <label class="col-md-6 control-label">Fecha y hora final</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1"><i class="fas fa-hourglass-end"></i></span></span>
                                </div>
                                <input id="horaout" type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" disabled>
                            </div>

                            <label class="col-md-6 control-label">Estado</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1"><i class="fas fa-check"></i></span></span>
                                </div>
                                <input id="estadoDesc" type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" disabled>
                            </div>



                        </div>


                    </div>
                    <div class="row">
                        <div class="col">


                            <label class="col-md-6 control-label">Procedimiento</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1"><i class="fas fa-procedures"></i></span></span>
                                </div>
                                <input id="ProcNomDetail" type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" disabled>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class=" modal-footer row" style="margin:0">
                <div class="col-sm-6 text-left" style="padding-left: 0px;"><button class="btn btn-danger btn-lg " onclick="close_form('Detail');" type="button" ><i class="fas fa-times"></i> Cerrar</button></div>
                <!--<div class="col-sm-4 text-center"><button id="incumplir" class="btn btn-secondary btn-lg " ><i class="fas fa-pen"></i>  Incumplir</button></div>-->
                <div class="col-sm-6 text-right" style="padding-left: 0px;"><button id="ready" class="btn btn-success btn-lg " ><i class="fas fa-check"></i>  Realizado</button></div>

            </div>

        </div>

    </div>
    <div id="mymodal"></div>
    <!--
            <div class="container" id="my_form" >
                <div class="row" style="text-align: center">
                    <div class="col">
                        <h5 id="datecreate"></h5>
                    </div>
                </div>
                <div class="stepwizard">
    
    
                    <div class="stepwizard-row setup-panel">
                        <div class="stepwizard-step">
                            <a id="btnstep1" href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
                            <p>Paso 1</p>
                        </div>
                        <div class="stepwizard-step">
                            <a id="btnstep2" href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
                            <p>Paso 2</p>
                        </div>
                        <div class="stepwizard-step">
                            <a id="btnstep3" href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
                            <p>Paso 3</p>
                        </div>
                    </div>
    
                </div>
    
    
                <div class="row setup-content" id="step-1">
                    <div class="col-xs-12">
                        <div class="col-md-12">
                            <h5> Paso 1 - Seleccionar Paciente</h5>
    
                            <div class="modalLoad ">
                            </div>
                            <div class="row">
                                <div class="col-sm-3 form-group">
                                    <label class="control-label">Tipo Doc.</label>
                                    <select id="tppaciente" name="tppaciente" class="form-control" required="required">
                                        <option value="N/A"disabled selected>Seleccione una opcion</option>
    
                                    </select>
                                </div>
                                <div class="col form-group">
                                    <label class="control-label">Numero de documento</label>
                                    <input id="idpaciente" name="idpaciente" type="text" placeholder="Ingrese numero documento" class="form-control" required="required" disabled>
                                </div>
                                <div class="col form-group">
                                    <label class="control-label">Nombre Completo</label>
                                    <input id="nompaciente" name="nompaciente" type="text" placeholder="Ingrese nombre " class="form-control" required="required" disabled>
                                </div> 
    
                                <div style="padding-top: 3%;">
                                    <button id="btnb1" class="btn btn-secondary btn-lg pull-right" type="button" > <i class="fas fa-search"></i> Buscar</button>
                                </div>
    
                            </div>
                            <div class="row">
                                <div class="col" style="height:207px;overflow:auto;">
                                    <table class="table table-sm table-striped">
                                        <thead class="thead-light">
                                            <tr>
                                                <th>Tipo doc</th>
                                                <th>Documento</th>
                                                <th>Nombre</th>
                                                <th><i class="fas fa-check"></th>
                                            </tr>
                                        </thead>
                                        <tbody id="tablepacientes">
    
                                        </tbody>
    
                                    </table>
                                </div>
                            </div>
                            <button id="btn1" class="btn btn-primary nextBtn btn-lg pull-right" type="button" disabled="disabled"><i class="fas fa-arrow-right"></i> Siguiente</button>
                            <button   class="btn btn-danger btn-lg pull-left" onclick="close_form()" type="button" ><i class="fas fa-times"></i> Cerrar</button>
    
                        </div>
                    </div>
                </div>
                <div class="row setup-content" id="step-2">
                    <div class="col-xs-12">
                        <div class="col-md-12">
                            <h5> Paso 2 - Seleccionar encargado del procedimiento</h5>
                            <div class="modalLoad ">
                            </div>
                            <div class="row">
                                <div class="col form-group">
                                    <label class="control-label">Identificador MED</label>
                                    <input id="iddoc" name="iddoc" type="text" placeholder="Ingrese codigo med " class="form-control" required="required" >
                                </div>
                                <div class="col form-group">
                                    <label class="control-label">Nombre Completo</label>
                                    <input id="nompdoc" name="nompdoc" type="text" placeholder="Ingrese nombre " class="form-control" required="required" >
                                    <input id="idespec" name="idespec" type="text" hidden="hidden">
                                    <input id="nomespec" name="nomespec" type="text" hidden="hidden">
                                </div>
    
                                <div style="padding-top: 3%;">
                                    <button  id="btnb2" class="btn btn-secondary btn-lg pull-right" type="button" ><i class="fas fa-search"></i> Buscar</button>
                                </div>
    
                            </div>
                            <div class="row">
                                <div class="col" style="height:207px;overflow:auto;">
                                    <table class="table table-sm table-striped">
                                        <thead class="thead-light">
                                            <tr>
    
                                                <th>Identificador</th>
                                                <th>Nombre</th>
                                                <th>Especialidad</th>
                                                <th><i class="fas fa-check"></i></th>
                                            </tr>
                                        </thead>
                                        <tbody id="tablepersonal">
    
                                        </tbody>
    
                                    </table>
                                </div>
                            </div>
                            <button id="btn2" class="btn btn-primary nextBtn btn-lg pull-right" onclick="paso2()" type="button" disabled="disabled"><i class="fas fa-arrow-right"></i> Siguiente</button>
                            <button   class="btn btn-danger btn-lg pull-left" onclick="close_form()" type="button" ><i class="fas fa-times"></i> Cerrar</button>
    
                        </div>
                    </div>
                </div>
                <div class="row setup-content" id="step-3">
                    <div class="col-xs-12">
                        <div class="col-md-12">
                            <h5> Paso 3 - Seleccionar procedimiento</h5>
                            <div class="modalLoad ">
                            </div>
                            <div class="row">
                                <div class="col form-group">
                                    <label class="control-label">Tipo de procedimiento</label>
                                    <select id="proc" name="proc" class="form-control" required>
                                        <option value="N/A" disabled selected>Seleccione una opcion</option>
    
                                    </select>
                                </div>
                                <div class="col form-group">
                                    <label class="control-label">Nombre procedimiento</label>
                                    <input id="procnomn" name="procnomn" type="text" placeholder="Ingrese nombre " class="form-control" required="required" >
                                    <input id="cups" name="cups" type="text" hidden="hidden">
                                </div>
    
                                <div style="padding-top: 3%;">
                                    <button  id="btnb3" class="btn btn-secondary btn-lg pull-right" type="button" ><i class="fas fa-search"></i> Buscar</button>
                                </div>
    
                            </div>
                            <div class="row">
                                <div class="col" style="height:207px;overflow:auto;">   
                                    <table class="table table-sm table-striped">
                                        <thead class="thead-light">
                                            <tr>
    
                                                <th>Codigo Procedimiento</th>
                                                <th>Nombre Procedimiento</th>
                                                <th>Fecha ordenado</th>
                                                <th><i class="fas fa-check"></th>
                                            </tr>
                                        </thead>
                                        <tbody id="tableprocs">
    
                                        </tbody>
    
                                    </table>
                                </div>
                            </div>
                            <button id="save" class="btn btn-success btn-lg pull-right"  onclick="save_form()" disabled="disabled">Guardar</button>
                            <button   class="btn btn-danger btn-lg pull-left" onclick="close_form();" type="button" ><i class="fas fa-times"></i> Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
            --!>
            <div class="modal fade" id="modalexcel" role="dialog">
                <div class="modal-dialog">
    
    <!-- Modal content-->
    <div class="modal-content">

        <div class="modal-header" style="padding:5px 10px;">
            <h3 style="vertical-align: middle">Fechas de reporte</h3>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
            <div class="form-group row">
                <label for="example-date-input" class="col-2 col-form-label">Inicio</label>
                <div class="col-10">
                    <input class="form-control" type="date" value="" id="date-input-start">
                </div>
            </div>
            <div class="form-group row">
                <label for="example-date-input" class="col-2 col-form-label">Fin</label>
                <div class="col-10">
                    <input class="form-control" type="date" value="" id="date-input-end">
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <div class="col-md-12">

                <button type="button" class="btn btn-success btn-lg pull-right" data-dismiss="modal" onclick="expexcel()">Generar</button>
                <button type="button" class="btn btn-default btn-lg pull-left" data-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>
            </div>
        </div>
    </div>

</div>
</div>
<div class="modal fade" id="modalborrar" role="dialog">
    <div class="modal-dialog" style="padding-top: 6%;">

        <!-- Modal content-->
        <div class="modal-content">

            <div class="modal-header" style="padding:5px 10px;">
                <h3 style="vertical-align: middle">Cancelar evento</h3>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group row">

                    <div class="col">

                        <h5>Motivo de cancelacion</h5>
                        <select id="motivo" class="form-control" required="required">
                            <option value="N/A" disabled="disabled" selected="selected">Seleccione una opcion</option> 

                        </select>
                        <h5>Observación de cancelacion</h5>
                        <textarea class="form-control" id="obsermotivo" rows="3" maxlength="150" style="resize: none"></textarea>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <div class="col-md-12">

                    <button type="button" id="borrarevent" class="btn btn-danger btn-lg pull-right" data-dismiss="modal" onclick="" disabled><i class="far fa-calendar-times"></i> Aplicar </button>
                    <button   type="button" class="btn btn-secondary btn-lg pull-left" data-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>
                </div>
            </div>
        </div>

    </div>
</div>

<div class="modal fade" id="modalincumplir" role="dialog">
    <div class="modal-dialog" style="padding-top: 6%;">

        <!-- Modal content-->
        <div class="modal-content">

            <div class="modal-header" style="padding:5px 10px;">
                <h3 style="vertical-align: middle">Incumplir evento</h3>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group row">

                    <div class="col">

                        <h5>Motivo de incumplimiento</h5>
                        <select id="motivoincu" class="form-control" required="required">
                            <option value="N/A" disabled="disabled" selected="selected">Seleccione una opcion</option> 

                        </select>
                        <h5>Observación de incumplimiento</h5>
                        <textarea class="form-control" id="obsermotivoincum" rows="3" maxlength="150" style="resize: none"></textarea>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <div class="col-md-12">

                    <button type="button" id="incumplirevent" class="btn btn-danger btn-lg pull-right" data-dismiss="modal" onclick="" disabled><i class="far fa-calendar-times"></i> Aplicar </button>
                    <button type="button" class="btn btn-secondary btn-lg pull-left" data-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>
                </div>
            </div>
        </div>

    </div>
</div>

<div class="modal fade" id="modalrealizar" role="dialog">
    <div class="modal-dialog" style="padding-top: 6%;">

        <!-- Modal content-->
        <div class="modal-content">

            <div class="modal-header" style="padding:5px 10px;">
                <h3 style="vertical-align: middle">Realizar evento</h3>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group row">

                    <div class="col">
                        <h5>Observación de realizacion</h5>
                        <textarea class="form-control" id="obsermotivoreal" rows="3" maxlength="150" style="resize: none"></textarea>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <div class="col-md-12">

                    <button type="button" id="realizarEvnt" class="btn btn-danger btn-lg pull-right" data-dismiss="modal" onclick="" disabled><i class="far fa-calendar-times"></i> Aplicar </button>
                    <button type="button" class="btn btn-secondary btn-lg pull-left" data-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>
                </div>
            </div>
        </div>

    </div>
</div>

<%@include file="/templates/footer.jsp" %> 

</body>
<script type="text/javascript" src="ProgramacionSalaHospijs/indexhorario.js" charset="utf-8"></script>

</html>
