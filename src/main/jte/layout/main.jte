@import org.springframework.security.web.csrf.CsrfToken
@param gg.jte.Content content


<!doctype html>
<html lang="de" class="h-full bg-white dark:bg-black dark:text-white">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Finco</title>
</head>
<body>
<main>
<%--    <nav>--%>
<%--        <div>--%>
<%--            <img src="/images/logo.png" alt="logo" />--%>
<%--            <h1>Finco</h1>--%>
<%--            <div>--%>
<%--                <button type="button"/>--%>
<%--                <button type="button"/>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </nav>--%>
    <div id="content">
        ${content}
    </div>
</main>
</body>
</html>