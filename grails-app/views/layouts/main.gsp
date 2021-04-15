<%--
  Created by IntelliJ IDEA.
  User: bbr
  Date: 22/05/2020
  Time: 13:45
--%>

<%@ page import="org.springframework.security.core.context.SecurityContextHolder; hockeybooking.Team" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>


    <g:layoutHead/>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark navbar-static-top" role="navigation">
    <a class="navbar-brand" href="/#"><asset:image src="dmon.jpg" alt="Dmon Logo"/></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
            aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" aria-expanded="false" style="height: 0.8px;" id="navbarContent">
        <ul class="nav navbar-nav ml-auto">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">Assist <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <g:each in="${Team.list()}" var="team">
                        <g:link controller="reservation" action="index" class="nav-link"
                                params="[team: team.name]">${team.name}</g:link>
                    </g:each>
                    <g:link controller="reservation" action="index" class="nav-link">View All</g:link>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">Schedule <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <g:each in="${Team.list()}" var="team">
                        <li class="dropdown-item">
                            <g:link controller="reservation" action="schedule"
                                    params="[id: team.id]">${team.name}</g:link>
                        </li>
                    </g:each>
                </ul>
            </li>

            <sec:ifAnyGranted roles="ROLE_ADMIN">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">Admin <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-item">
                            <g:link controller="training">Edit Trainings</g:link>
                        </li>
                        <li class="dropdown-item">
                            <g:link controller="player">Edit Players</g:link>
                        </li>
                        <li class="dropdown-item">

                            <g:link controller="team">Edit Teams</g:link>
                        </li>
                        <li class="dropdown-item">

                            <g:link controller="trainer">Edit Trainers</g:link>
                        </li>
                        <li class="dropdown-item">
                            <g:link controller="overview">Overview</g:link>
                        </li>
                        <li class="dropdown-item">
                            <g:link controller="data" action="render">JSON export</g:link>
                        </li>
                        <li class="dropdown-item">
                            <g:link controller="data" action="prepare">CSV import</g:link>
                        </li>

                    </ul>
                </li>
            </sec:ifAnyGranted>

        </ul>
    </div>

</nav>


<g:layoutBody/>

<div class="footer row" role="contentinfo">
    <div class="col">
        <a href="http://www.dmon.be">Hockey Dendermonde</a>
    </div>

    <div class="col">
        <sec:ifLoggedIn>
            Logged in as ${SecurityContextHolder.context?.authentication?.name}
            <g:link elementId="logout_link">(log out)</g:link>
        </sec:ifLoggedIn>
    </div>

    <div class="col">
        code by <a href="https://www.twitter.com/bavobbr">Bavo Bruylandt</a>
    </div>
</div>

<g:javascript>
    $('#logout_link').click(function () {
        console.log("clicked log out")
        $.post('/logout/index');
        window.location.href = "/";
    });
</g:javascript>


<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>
</body>
</html>