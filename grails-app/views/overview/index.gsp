<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to dmon</title>
</head>

<body>

<div id="content" role="main">
    <section class="row colset-2-its">
        <h1>Teams</h1>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Trainer</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${teams}" var="team" status="idx">
                <tr>
                    <td scope="row">${idx+1}</td>
                    <td>${team.name}</td>
                    <td>${team.trainers?.collect { it.name }.join(", ")}</td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <h1>Players</h1>

        <table class="table">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Responsible</th>
                <th scope="col">Team</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${players}" var="player" status="idx">
                <tr>
                    <td scope="row">${idx+1}</td>
                    <td>${player.name}</td>
                    <td>${player.email}</td>
                    <td>${player.responsible}</td>
                    <td>${player.team?.name}</td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <h1>Trainers</h1>

        <table class="table">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Teams</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${trainers}" var="trainer" status="idx">
                <tr>
                    <td scope="row">${idx+1}</td>
                    <td>${trainer.name}</td>
                    <td>${trainer.email}</td>
                    <td>${trainer.team?.collect { it.name}?.join(", ")}</td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <h1>Trainings</h1>

        <table class="table">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Team</th>
                <th scope="col">Max</th>
                <th scope="col">Date</th>
                <th scope="col">Players</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${trainings}" var="training" status="idx">
                <tr>
                    <td scope="row">${idx+1}</td>
                    <td>${training.team?.name}</td>
                    <td>${training.maxPlayers}</td>
                    <td>${training.date}</td>
                    <td>${training.registeredPlayers*.name.join(", ")}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </section>
</div>

</body>