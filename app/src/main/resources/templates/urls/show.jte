@import hexlet.code.App
@import hexlet.code.dto.UrlPage
@import hexlet.code.util.NamedRoutes

@param UrlPage page

@template.layout.page(
content = @`
    <main>
        <h1>Название сайта: ${page.getUrl().getName()}</h1>
        <p>ID : ${page.getUrl().getId()}</p>
        <p>Имя : ${page.getUrl().getName()}</p>
        <p>Дата создания : ${App.getFormattedTime(page.getUrl().getCreatedAt())}</p>

        <h2>Проверки</h2>

        <form method="post" action="${NamedRoutes.urlCheckPath(page.getUrl().getId())}">
            <button type="submit" class="btn btn-primary">Запустить проверку</button>
        </form>

        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Имя</th>
                <th>Последняя проверка</th>
                <th>Код ответа</th>
            </tr>
            </thead>
            @if(!page.getChecks().isEmpty())
            <tbody>
            @for (var check : page.getChecks())
                <tr>
                    <td>${check.getId()}</td>
                    <td>${check.getStatusCode()}</td>
                    <td>${check.getTitle()}</td>
                    <td>${check.getH1()}</td>
                    <td>${check.getDescription()}</td>
                    <td>${App.getFormattedTime(check.getCreatedAt())}</td>
                </tr>
            @endfor
            </tbody>
            @endif
        </table>
    </main>
`
)