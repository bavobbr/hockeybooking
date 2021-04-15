<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Hockey Dendermonde - Reservation Schedule</title>
</head>

<body>

<g:javascript>
    <g:each in="${trainings}" status="idx" var="training">
    $(document).ready(function(){
        var $checkboxes = $('input[type="checkbox"]').filter('input[id^="t-${training.id}-"]');
        var countCheckedCheckboxes = $checkboxes.filter(':checked').length;
        $('#count-checked-checkboxes-${training.id}').text(countCheckedCheckboxes);
        if (countCheckedCheckboxes > ${training.maxPlayers}) {
           $('#count-checked-checkboxes-${training.id}').addClass("toomuch");
        }
    });
    </g:each>
</g:javascript>

<g:javascript>
    $(document).ready(function() {
        $("#success-add-alert").hide();
        $("#success-remove-alert").hide();
    });
    function showAlert(add) {
        if (add) {
            $("#success-add-alert").fadeTo(2000, 500).slideUp(500, function () {
                $("#success-add-alert").slideUp(500);
            });
        }
        else {
            $("#success-remove-alert").fadeTo(2000, 500).slideUp(500, function () {
                $("#success-remove-alert").slideUp(500);
            });
        }
    }
</g:javascript>

<div id="content" role="main">
    <section class="row colset-2-its">
        <h1>Training Schedule
            <small class="text-muted">Spot reservations</small>
        </h1>
        <p>
            Displaying all trainings by <strong>${team?.trainers?.collect { it.name}.join(", ")}</strong> for <strong>${team?.name}</strong>. If you want to help in a training, go to the specific training at <g:link action="index">trainings</g:link> and add your name.
        </p>

        <table class="table">
            <thead>
            <tr>
                <th>Player</th>
                <g:each in="${trainings}" var="training">
                    <th>
                        <g:link action="reserve" params="[id: training.id]">
                        <g:formatDate date="${training.date}" format="dd/MM"/>
                        </g:link>
                    </th>
                </g:each>
            </tr>
            </thead>
            <tbody>
            <g:each in="${team.players.sort { it.name }}" var="player" status="idx">
                <tr>
                    <td><g:link action="view" params="[id: player.id]">${player.name}</g:link></td>
                    <g:each in="${trainings}" var="training">
                        <td><g:checkBox name="player_${player.id}" checked="${player in training.registeredPlayers}"
                                        value="${training.id}_${player.id}" id="t-${training.id}-${idx}"
                                        onchange="bookPlayer(this)" disabled="true"></g:checkBox></td>
                    </g:each>
                </tr>
            </g:each>
            </tbody>
            <tfoot>
            <tr>
                <td></td>
                <g:each in="${trainings}" var="training">
                    <td><span id="count-checked-checkboxes-${training.id}">0</span> / ${training.maxPlayers}</td>
                </g:each>
            </tr>
            </tfoot>
        </table>
    </section>


</div>

</body>