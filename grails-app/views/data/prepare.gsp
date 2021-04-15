<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Data upload</title>
</head>

<body>

<div id="content" role="main">

    <section class="row colset-2-its">
        <h1>Data upload</h1>
        <p>
            Upload initial CSV data
        </p>

        <g:form action="load">
            <div class="form-group row">
                <label for="data" class="col-4 col-form-label">Text Area</label>
                <div class="col-8">
                    <textarea id="data" name="data" cols="40" rows="5" class="form-control"></textarea>
                </div>
            </div>
            <div class="form-group row">
                <div class="offset-4 col-8">
                    <button name="submit" type="submit" class="btn btn-primary">Send</button>
                </div>
            </div>
        </g:form>

        <g:if test="${imported}">
            <table class="table">
                <thead>
                <tr>
                    <td>Name</td>
                    <td>Email</td>
                    <td>Date</td>
                    <td>Category</td>
                </tr>
                </thead>
                <tbody>
                <g:each in="${imported}" var="p">
                    <tr>
                        <td>${p.name}</td>
                        <td>${p.email}</td>
                        <td>${p.birthdate}</td>
                        <td>${p.category}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>

        </g:if>
    </section>
</div>

</body>

