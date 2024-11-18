@template.layout.main(content = @`
    <div class="flex flex-col items-center">
        <div id="home_card" class="flex justify-center">
            <img src="/images/Card.png" alt="card Logo" />
        </div>
        <h1>Total wallet</h1>
        <div id="home_content" class="flex items-center" style="" >
            <div id="home_income" class="flex flex-col justify-between items-start w-32 h-32" style=" background: rgba(255, 255, 255, 0.25); box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37); backdrop-filter: blur(3px); -webkit-backdrop-filter: blur(3px); border-radius: 10px; border: 1px solid rgba(255, 255, 255, 0.18);">
                <img src="/images/Income.png" alt="income Logo" class="self-start" style="margin-left: 1em; margin-top:0.25em"/>
                <p style="margin-left: 1em">Income</p>
                <p style="margin: 0 auto; font-size: 1.25rem; line-height: 1.5; font-weight: bold;"><span id="income-value"></span></p>
            </div>

            <div id="home_expenses" class="flex flex-col justify-between items-start w-32 h-32" style="margin-left: 1em;background: rgba(255, 255, 255, 0.25); box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37); backdrop-filter: blur(3px); -webkit-backdrop-filter: blur(3px); border-radius: 10px; border: 1px solid rgba(255, 255, 255, 0.18);">
                <img src="/images/Expense.png" alt="expense logo" class="self-start" style="margin-left: 1em; margin-top:0.25em"/>
                <p style="margin-left: 1em">Expense</p>
                <p style="margin: 0 auto; font-size: 1.25rem; line-height: 1.5; font-weight: bold;"><span id="expense-value"></span></p>
            </div>
        </div>
        <div id="Home_monthly" class="flex flex-col items-center">
            <img src="/images/Icon.png" alt="icon logo"/>
            <div class="text-center">
                <p>Monthly spending Limit</p>
                <p><span id="spend-value" style="font-size: 1.25rem; line-height: 1.5; font-weight: bold;"></span></p>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            //! Datenbank einkommen ausgaben value einbinden
            let invalue = 1000;
            let outvalue = 400;
            let spendvalue = 10000;
            let currency = "$";

            document.getElementById("income-value").textContent = "+" + currency + invalue;
            document.getElementById("expense-value").textContent = "-" + currency + outvalue;
            document.getElementById("spend-value").textContent = currency + spendvalue;
        });
    </script>
`)
