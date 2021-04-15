<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Reserve a spot - Player bookings</title>
</head>

<body>

<div id="content" role="main">

    <section class="row colset-2-its">
    <h1>Player bookings for ${player.name}</h1>
        <p>
            This shows all the current spots reserved for the player.
        </p>
        <table class="table">
            <thead>
            <tr>
                <th>Team</th>
                <th>Date</th>
                <th>#Players</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${player.trainings}" var="training" status="idx">
                <tr>
                    <td>${training.team.name}</td>
                    <td><g:link controller="reservation" action="reserve" params="[id: training.id]">${training.date}</g:link></td>
                    <td>${training.registeredPlayers.size()}</td>
                    <td><g:link controller="reservation" action="reserve" params="[id: training.id]">open</g:link> </td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </section>
</div>

</body>