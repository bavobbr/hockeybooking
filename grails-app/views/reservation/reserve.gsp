<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Hockey Dendermonde - Training Reservation</title>
</head>

<body>

<g:javascript>
function bookPlayer(checkboxElem) {
    let reply = $.post("/${controllerName}/bookPlayer", {
            playerid: checkboxElem.value,
            present: checkboxElem.checked,
            trainingid: ${training.id}
    },
    function (data) {
        console.log(data)
    }, "json");

    reply.done(function (data) {
        $("#success-add-alert").text(data.message)
        showAlert(checkboxElem.checked);
    }).fail(function(data) {
        $("#success-add-alert").text(data.message)
        alert(data.message);
        checkboxElem.checked = false;
        if ("createEvent" in document) {
            let evt = document.createEvent("HTMLEvents");
            evt.initEvent("change", false, true);
            checkboxElem.dispatchEvent(evt);
        }
    });
}
</g:javascript>
<g:javascript>
    $(document).ready(function () {
        var $checkboxes = $('input[type="checkbox"]');
        var countCheckedCheckboxes = $checkboxes.filter(':checked').length;
        $('#count-checked-checkboxes').text(countCheckedCheckboxes);
        if (countCheckedCheckboxes > ${training.maxPlayers}) {
            $('#count-checked-checkboxes').addClass("toomuch");
        }

        $checkboxes.change(function () {
            var countCheckedCheckboxes = $checkboxes.filter(':checked').length;
            $('#count-checked-checkboxes').text(countCheckedCheckboxes);
            if (countCheckedCheckboxes > ${training.maxPlayers}) {
                $('#count-checked-checkboxes').addClass("toomuch");
            }
            else {
                $('#count-checked-checkboxes').removeClass("toomuch");
            }
        });
    });
</g:javascript>
<g:javascript>
    $(document).ready(function () {
        $("#success-add-alert").hide();
        $("#success-remove-alert").hide();
    });
    function showAlert(add) {
        if (add) {
            $("#success-add-alert").fadeTo(2000, 500).slideUp(500, function () {
                $("#success-add-alert").slideUp(500);
            });
        } else {
            $("#success-remove-alert").fadeTo(2000, 500).slideUp(500, function () {
                $("#success-remove-alert").slideUp(500);
            });
        }
    }
</g:javascript>

<div id="content" role="main">
    <section class="row colset-2-its">
        <h1>Training
            <small class="text-muted">Select a spot for a player</small>
        </h1>

        <div class="row">
            <p>
                Editing training at <strong><g:formatDate date="${training.date}"
                                                          format="dd/MM/yyyy hh:mm"/></strong> by <strong>${team.trainers?.collect { it.name }.join(", ")}</strong> for <strong>${team.name}.</strong>
                Note that edits are saved directly.
            </p><br/>
        </div>
        <table class="table">
            <thead>
            <tr>
                <th>Player</th>
                <th>Responsible</th>
                <th>Present</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${players}" var="player" status="idx">
                <tr>
                    <td><g:link action="view" params="[id: player.id]">${player.name}</g:link></td>
                    <td>${player.responsible}</td>
                    <td><g:checkBox name="player_${player.id}" checked="${player in training.registeredPlayers}"
                                    value="${player.id}"
                                    onchange="bookPlayer(this)"></g:checkBox></td>
                </tr>
            </g:each>
            </tbody>
            <tfoot>
            <tr>
                <td></td>
                <td></td>
                <td><span id="count-checked-checkboxes">0</span> / ${training.maxPlayers}</td>
            </tr>
            </tfoot>
        </table>

        <div class="alert alert-success" id="success-add-alert">
            <strong>Success!</strong> Player added to the training.
        </div>

        <div class="alert alert-warning" id="success-remove-alert">
            <strong>Success!</strong> Player removed from the training.
        </div>
    </section>

    <section class="row colset-2-its">
        <h1>Training
            <small class="text-muted">Help out as a parent</small>
        </h1>
        <table class="table">
            <g:form action="assist">
                <g:hiddenField name="trainingid" value="${training.id}"/>
                <div class="form-group row">
                    <label class="col-3 col-form-label" for="fa">Field Assistant</label>

                    <div class="col-9">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fa fa-hand-paper-o"></i>
                                </div>
                            </div>
                            <input id="fa" name="fa" type="text" aria-describedby="faHelpBlock" class="form-control"
                                   value="${training.fieldAssistant}">
                        </div>
                        <span id="faHelpBlock" class="form-text text-muted">Asists on the field</span>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="ha" class="col-3 col-form-label">Hygienic Assistant</label>

                    <div class="col-9">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fa fa-female"></i>
                                </div>
                            </div>
                            <input id="ha" name="ha" type="text" aria-describedby="haHelpBlock" class="form-control"
                                   value="${training.hygienicAssistant}">
                        </div>
                        <span id="haHelpBlock" class="form-text text-muted">Helps kids to the lavatory</span>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="ta" class="col-3 col-form-label">Terrain Responsible</label>

                    <div class="col-9">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <i class="fa fa-user-circle-o"></i>
                                </div>
                            </div>
                            <input id="ta" name="ta" type="text" aria-describedby="taHelpBlock" class="form-control"
                                   value="${training.terrainAssistant}">
                        </div>
                        <span id="taHelpBlock" class="form-text text-muted">Enforce social distancing</span>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-4">Reviewed</label>

                    <div class="col-8">
                        <div class="custom-control custom-radio custom-control-inline">
                            <g:radio name="reviewed" id="reviewed_0" class="custom-control-input" value="true"
                                     checked="${training.reviewed}"/>
                            <label for="reviewed_0" class="custom-control-label">Yes</label>
                        </div>

                        <div class="custom-control custom-radio custom-control-inline">
                            <g:radio name="reviewed" id="reviewed_1" class="custom-control-input" value="false"
                                     checked="${!training.reviewed}"/>
                            <label for="reviewed_1" class="custom-control-label">No</label>
                        </div>
                        <span id="radioHelpBlock" class="form-text text-muted">Is training entry final?</span>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-9">
                        <button name="submit" type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </g:form>
        </table>
        <small>
            <sec:ifAnyGranted roles="ROLE_ADMIN">
                <g:link action="copyTraining" id="${training.id}">[copy training for next week]</g:link>
            </sec:ifAnyGranted>
        </small>
    </section>
</div>

</body>