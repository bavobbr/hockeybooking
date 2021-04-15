<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Hockey Dendermonde - Training Overview</title>
</head>

<body>

<div id="content" role="main">

    <section class="row colset-2-its">
        <h1>Coming trainings
        </h1>

        <div class="row">
            <p>
            You can add or remove players from a training by selecting the training and then checking the boxes. You can also add yourself as an assistant on a specific training.
            </p>
        </div>

        <div class="row">
            <p>
            Filter:
            <g:each in="${teamnames}" var="name">
                <g:link action="index" params="[team: name]">[${name}]</g:link>
                <span class="caret"></span>
            </g:each>
            <g:link action="index">
                [All]
            </g:link>
            </p>
        </div>
        <g:render template="trainingTable" model="[trainings: trainings]" />

        <h1>Past Trainings
        </h1>
        <g:render template="trainingTable" model="[trainings: pastTrainings]" />


    </section>
</div>

</body>